import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features.export.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final AuthenticationUseCases? authenticationUseCases;
static LoginBloc get(context) => BlocProvider.of(context);

  ForgetPasswordBloc({this.authenticationUseCases}) : super(ForgetPasswordInitial()) {
    ///on<GetTokenEvent>(_getToken);
    ///on<PasswordVisibilityEvent>(_onPassVisibility);
  }


}