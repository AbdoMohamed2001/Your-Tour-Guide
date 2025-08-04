import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:your_tour_guide/core/utils/app_locale.dart';
import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/core/utils/functions/simple_bloc_observer.dart';
import 'package:your_tour_guide/core/utils/theme/theme_class.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/cubits/home/home_cubit.dart';
import 'core/services/firebase_auth_services.dart';
import 'core/services/get_it_services_locator.dart';
import 'core/services/shared_prefs_services.dart';
import 'features/home/presentation/views/main_view.dart';
import 'features/splash/presentation/views/welcome_view.dart';
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
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _initializeNonCriticalServices();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>.value(
          value: getIt<HomeCubit>(),
        ),
      ],
      child: StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker.instance.onStatusChange;
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return MaterialApp(
              builder: DevicePreview.appBuilder,

              debugShowCheckedModeBanner: false,
              // App configuration
              title: 'Your Tour Guide',
              locale: getIt<HomeCubit>().currentLocale,
              // Theme configuration
              theme: ThemeClass.lightTheme,
              darkTheme: ThemeClass.darkTheme,
              themeMode: getIt<HomeCubit>().currentThemeMode,
              // Localization configuration
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
              home: _buildHome(),
            );
          },
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------------
_buildHome() {
  // Cache the auth check result to avoid repeated calls
  final isLoggedIn = FirebaseAuthService().isLoggedIn();
  return isLoggedIn ? const MainView() : const WelcomeView();
}

//-----------------------------------------------------------------------------
Future<void> _initializeCriticalServices() async {
  try {
    // Initialize only critical services that block app startup
    await CacheData.cacheInit();
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

Future<void> _initializeNonCriticalServices() async {
  try {
    // Initialize HomeCubit data after UI is ready
    await getIt<HomeCubit>().initializeApp();

    // Add other non-critical initializations here
    // e.g., analytics, crashlytics, etc.
  } catch (e) {
    debugPrint('Non-critical service initialization failed: $e');
    // Non-critical failures shouldn't crash the app
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
