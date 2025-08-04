import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/splash/presentation/views/welcome_view.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../home/presentation/views/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final isLoggedIn = FirebaseAuthService().isLoggedIn();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => isLoggedIn ? const MainView() : const WelcomeView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()), // or splash logo
    );
  }
}
