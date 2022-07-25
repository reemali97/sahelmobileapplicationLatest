import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.export.dart';
import '../../../../features.export.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationUseCases? authenticationUseCases;

  static LoginBloc get(context) => BlocProvider.of(context);

  LoginBloc({this.authenticationUseCases}) : super(LoginInitial()) {
    on<GetTokenEvent>(_getToken);
    on<PasswordVisibilityEvent>(_onPassVisibility);
  }

  Future<void> _getToken(GetTokenEvent event, Emitter<LoginState> emit) async {
    ApiResponse? apiResponse;
    var context = event.context;
    String email = event.userName;
    String password = event.passWord;

    try {
      ProgressCircleDialog.show(context);
      await authenticationUseCases!
          .getToken(email, password)
          .then((value) async {
        apiResponse = value;
        await _getUserData(
                token: apiResponse!.data['token'],
                userName: email,
                context: context)
            .then((value) {
          emit(SuccessGetUserDataState());
        });
      });
      ProgressCircleDialog.dismiss(context);

      emit(GetTokenState(token: apiResponse!.data['token']));
    } catch (onError) {
      debugPrint(onError.toString());
      ProgressCircleDialog.dismiss(context);
      emit(ErrorGetTokenState(error: onError.toString()));
    }
  }

  Future<dynamic> _getUserData(
      {String? userName, String? token, context}) async {
    ApiResponse? apiResponse;
    try {
      apiResponse =
          await authenticationUseCases!.getUserData(userName!, token!);
      if (apiResponse.data != null) {
        openNewPage(context, MainScreen(), popPreviousPages: true);
      }
      return apiResponse;
    } catch (onError) {
      debugPrint(onError.toString());
      return 'error get User Data';
    }
  }

  bool? isVisible = true;
  IconData? modeIcon = Icons.visibility;

  void _onPassVisibility(
      PasswordVisibilityEvent event, Emitter<LoginState> emit) {
    isVisible = !isVisible!;
    modeIcon = isVisible! ? Icons.visibility : Icons.visibility_off;
    emit(PasswordVisibilityState(isVisible: isVisible, modeIcon: modeIcon));
  }
}
