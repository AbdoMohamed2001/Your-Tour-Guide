import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/splash/presentation/views/welcome_view.dart';

import '../../../../core/cubits/home/home_cubit.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../home/presentation/views/main_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      centered: true,
      backgroundColor: HomeCubit.get(context).isDarkMode
          ? Color(0xff121212)
          : Color(0xfff3f6f4),
      splashIconSize: 880,
      splash: HomeCubit.get(context).isDarkMode == false
          ? 'assets/images/appLogoLightMode.png'
          : 'assets/images/appLogoDarkMode.png',
      nextScreen:
          FirebaseAuthService().isLoggedIn() ? MainView() : WelcomeView(),
    );
  }
}
