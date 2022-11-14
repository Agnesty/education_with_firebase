import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:education_app_with_firebase/screens/onboardingscreen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "/splashscreen";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Agnesty Edu", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 300,
                height: 300,
                child: LottieBuilder.network(
                    "https://assets3.lottiefiles.com/packages/lf20_DMgKk1.json"),
              ),
              const Text("Hello", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
            ],
          ),
        ),
      ),
      nextScreen: const OnBoardingScreen(),
      duration: 5000,
      splashIconSize: 350,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
