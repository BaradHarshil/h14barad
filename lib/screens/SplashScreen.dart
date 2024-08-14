import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import 'OnBoardingScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add a delay to simulate a splash screen.
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to the next screen after the delay.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingScreen()),
      );
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: CustomColors.kPrimaryColor,
        body: Center(
          child: Image.asset(CustomImagePath.splashImagePath,),
        ),
      ),
    );
  }
}
