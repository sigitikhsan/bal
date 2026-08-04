import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const BalmonApp());
}

class BalmonApp extends StatelessWidget {
  const BalmonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balmon',

      theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}