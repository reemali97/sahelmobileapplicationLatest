import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features.export.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {

  static PersonalInfoBloc get(context) => BlocProvider.of(context);

  PersonalInfoBloc() : super(PersonalInfoInitial()) {
    on<OnEditEvent>(_onEdit);

  }

  bool? isEnable = false;

  void _onEdit(OnEditEvent event, Emitter<PersonalInfoState> emit) {
    isEnable = !isEnable!;
    emit(OnEditState(isEnable: isEnable));
  }
}
