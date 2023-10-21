import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/pages/onboarding/onboarding_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/images/todo-splah.json'),
      splashIconSize: 250,
      duration: 1000,
      nextScreen: const OnboardingPage(),
    );
  }
}
