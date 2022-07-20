import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahelmobileapplication/features/home/home.export.dart';
import '../features/authentication/presentation/presentation.export.dart';
import '../core/injection/injection.export.dart' as di;

MultiBlocProvider listOfBlocProviders({Widget? child}) {
  return MultiBlocProvider(
    providers: [
      ///Authentication Feature Blocs
      BlocProvider<LoginBloc>(create: (context)=> di.sl<LoginBloc>(),),
      BlocProvider<ForgetPasswordBloc>(create: (context)=> ForgetPasswordBloc(),),
      ///Home Feature Blocs
      BlocProvider<MainBloc>(create: (context)=> MainBloc(),),
      ///

    ],
    child: child!,
  );
}
