import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'themes/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const AdoptPetsApp());
}

class AdoptPetsApp extends StatelessWidget {
  const AdoptPetsApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RescuePaws',
      theme: AppTheme.light(),
      home: const SplashScreen(),
    );
  }
}