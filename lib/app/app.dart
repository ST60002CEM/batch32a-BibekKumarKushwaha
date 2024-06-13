import 'package:final_assignment/app/navigator_key/navigator_key.dart';
import 'package:final_assignment/features/splash/presentation/view/splash_view.dart';

import 'package:flutter/material.dart';
//import 'package:final_assignment/theme/theme_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      navigatorKey: AppNavigator.navigatorKey,
    );
  }
}
