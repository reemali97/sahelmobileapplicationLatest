import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/injection/injection.export.dart' as di;
import '../features/features.export.dart';

MultiBlocProvider listOfBlocProviders({Widget? child}) {
  return MultiBlocProvider(
    providers: [

      ///Authentication Feature Blocs
      BlocProvider<LoginBloc>(create: (context)=> di.sl<LoginBloc>(),),
      BlocProvider<ForgetPasswordBloc>(create: (context)=> ForgetPasswordBloc(),),
      BlocProvider<ChangeLanguageBloc>(create: (context)=> ChangeLanguageBloc(),),

      ///Home Feature Blocs
      BlocProvider<MainBloc>(create: (context)=> MainBloc(),),

      ///Profile Feature Blocs
      BlocProvider<PersonalInfoBloc>(create: (context)=> di.sl<PersonalInfoBloc>(),),
      BlocProvider<ChangePasswordBloc>(create: (context)=> di.sl<ChangePasswordBloc>(),),


    ],
    child: child!,
  );
}
