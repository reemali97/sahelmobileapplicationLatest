import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahelmobileapplication/config/bloc_providers.dart';
import 'core/core.export.dart';
import 'features/authentication/authentication.export.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../core/injection/injection.export.dart' as di;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DependencyInjectionInit().init();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = di.sl();
  @override
  Widget build(BuildContext context) {
    return listOfBlocProviders(
      child: BlocConsumer<ChangeLanguageBloc, ChangeLanguageState>(
        listener: (context, state) {
          if(state is SuccessChangeLanguageState){
            _locale = state.locale;
          }
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            locale: _locale,
            supportedLocales: const[
              Locale("en", "US"),
              Locale("ar", "EG"),
            ],
            localizationsDelegates: const[
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return null;
            },
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
