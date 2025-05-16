import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/theme/app_theme.dart';
import 'package:furniture_app/src/features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture App',
      theme: appTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
