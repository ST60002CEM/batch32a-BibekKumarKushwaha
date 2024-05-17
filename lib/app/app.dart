import 'package:final_assignment/screen/login_screen.dart';
import 'package:final_assignment/screen/signup_screen.dart';
import 'package:final_assignment/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
