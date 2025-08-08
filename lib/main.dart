import 'package:flutter/services.dart';
import 'package:your_tour_guide/core/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/core/utils/app_locale.dart';
import 'package:your_tour_guide/features/splash/presentation/views/splash_view.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/core/utils/functions/simple_bloc_observer.dart';
import 'package:your_tour_guide/core/utils/theme/theme_class.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/cubits/locale_cubit/locale_cubit.dart';
import 'core/cubits/theme/theme_cubit.dart';
import 'core/services/get_it_services_locator.dart';
import 'core/services/shared_prefs_services.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set preferred orientations early for better performance
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await _initializeCriticalServices();

  runApp(
    MyApp(),
    // DevicePreview(
    //   // enabled: !kReleaseMode,
    //   builder: (BuildContext context) {
    //     return MyApp();
    //   },
    // ),
  );
  // Defer heavy work until after first frame
  // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   _initializeNonCriticalServices();
  // });
}

//-----------------------------------------------------------------------------
Future<void> _initializeCriticalServices() async {
  try {
    // Initialize only critical services that block app startup
    await Prefs.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    setupGetIt();
    Bloc.observer = SimpleBlocObserver();
  } catch (e) {
    // Handle initialization errors gracefully
    debugPrint('Critical service initialization failed: $e');
    // You might want to show an error screen or retry mechanism
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<HomeCubit>()),
        BlocProvider(create: (_) => getIt<ThemeCubit>()..getSavedTheme()),
        BlocProvider(create: (_) => getIt<LocaleCubit>()..getSavedLanguage()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
            return MaterialApp(
              builder: DevicePreview.appBuilder,

              debugShowCheckedModeBanner: false,
              // APP configuration
              title: 'Your Tour Guide',
              locale: getIt<LocaleCubit>().currentLocale,
              // THEME configuration
              theme: ThemeClass.lightTheme,
              darkTheme: ThemeClass.darkTheme,
              themeMode: getIt<ThemeCubit>().currentThemeMode,
              // LOCALIZATION configuration
              localizationsDelegates: [
                S.delegate,
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'),
                Locale("ar"),
              ],
              localeResolutionCallback: _localeResolutionCallback,
              home: SplashView(),
            );
          });
        },
      ),
    );
  }
}

//-----------------------------------------------------------------------------
//HELP METHODS
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
Locale? _localeResolutionCallback(
  Locale? currentLocale,
  Iterable<Locale> supportedLocales,
) {
  if (currentLocale != null) {
    for (var locale in supportedLocales) {
      if (currentLocale.languageCode == locale.languageCode) {
        return currentLocale;
      }
    }
  }
  return supportedLocales.first;
}
//-----------------------------------------------------------------------------
