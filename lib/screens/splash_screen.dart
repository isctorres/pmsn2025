import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025/screens/list_students_screen.dart';
import 'package:pmsn2025/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        duration: Duration(milliseconds: 3800),
        nextScreen: LoginScreen(),
        backgroundColor: Colors.white,
        splashScreenBody: Center(
          child: Lottie.asset("assets/tecnm.json"),
        ),
      )
    );
  }
}