import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:your_tour_guide/add_field_to_all_documents_function.dart';
import 'package:your_tour_guide/app_locale.dart';
import 'package:your_tour_guide/core/data/repos/places_repo.dart';
import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/features/nav_bar/presentation/views/main_view.dart';
import 'package:your_tour_guide/features/splash/presentation/views/welcome_view.dart';
import 'package:your_tour_guide/simple_bloc_observer.dart';
import 'package:your_tour_guide/theme_class.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/services/get_it_services_locator.dart';
import 'firebase_options.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInit();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
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
    Bloc.observer = SimpleBlocObserver();
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<PlacesRepo>())
        ..getSavedTheme()
        ..getSavedLanguage(),
      child: StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker.instance.onStatusChange;
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return MaterialApp(
              locale: HomeCubit.get(context).locale,
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
              localeResolutionCallback: (currentLocal, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (currentLocal != null &&
                      currentLocal.languageCode == locale.languageCode) {
                    return currentLocal;
                  }
                }
                return supportedLocales.first;
              },
              debugShowCheckedModeBanner: false,
              title: 'Your Tour Guide',
              theme: ThemeClass.lightTheme,
              darkTheme: ThemeClass.darkTheme,
              themeMode: HomeCubit.get(context).isDark!
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: StreamBuilder<User?>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Scaffold(
                      extendBodyBehindAppBar: true,
                      body: HomeCubit.get(context).isDark == false
                          ? AnimatedSplashScreen(
                              centered: true,
                              backgroundColor: Color(0xfff3f6f4),
                              splashIconSize: 880,
                              splash: 'assets/images/appLogoLightMode.png',
                              nextScreen: MainView(),
                            )
                          : AnimatedSplashScreen(
                              centered: true,
                              backgroundColor: Color(0xff121212),
                              splashIconSize: 880,
                              splash: 'assets/images/appLogoDarkMode.png',
                              // nextScreen: AddField(),
                              nextScreen: MainView(),
                            ),
                    );
                    // return HomePage();
                  }
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      ),
                    );
                  }
                  return AnimatedSplashScreen(
                    centered: true,
                    backgroundColor: Color(0xfff9f9f9),
                    splashIconSize: 880,
                    splash: 'assets/images/appLogoLightMode.png',
                    nextScreen: WelcomeView(),
                  );
                },
                stream: FirebaseAuth.instance.authStateChanges(),
              ),
            );
          },
        ),
      ),
    );
  }
}
