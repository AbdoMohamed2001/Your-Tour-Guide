import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:your_tour_guide/core/utils/app_locale.dart';
import 'package:your_tour_guide/features/places/data/repos/places_repo.dart';
import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/features/splash/presentation/views/splash_view.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/core/utils/functions/simple_bloc_observer.dart';
import 'package:your_tour_guide/core/utils/theme/theme_class.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/cubits/home/home_cubit.dart';
import 'core/services/get_it_services_locator.dart';
import 'core/services/shared_prefs_services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeServices();

  runApp(
    DevicePreview(
      // enabled: !kReleaseMode,
      builder: (BuildContext context) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<PlacesRepo>())..initializeApp(),
      child: StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker.instance.onStatusChange;
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final homeCubit = context.read<HomeCubit>();
            return MaterialApp(
              locale: homeCubit.currentLocale,
              builder: DevicePreview.appBuilder,
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
              debugShowCheckedModeBanner: false,
              title: 'Your Tour Guide',
              theme: ThemeClass.lightTheme,
              darkTheme: ThemeClass.darkTheme,
              themeMode: homeCubit.currentThemeMode,
              home: SplashView(),
            );
          },
        ),
      ),
    );
  }
}
//-----------------------------------------------------------------------------
//HELP METHODS
//-----------------------------------------------------------------------------

Future<void> _initializeServices() async {
  await CacheData.cacheInit();
  await Prefs.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  setupGetIt();
}

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
