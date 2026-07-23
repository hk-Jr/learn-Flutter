import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  debugPrint('Ks ---');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kinetic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF09090B),
        primaryColor: const Color(0xFF00F0FF),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00F0FF), // Neon Cyan
          secondary: Color(0xFFFF007F), // Neon Pink
          surface: Color(0xFF16161A), // Slightly lighter dark
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
