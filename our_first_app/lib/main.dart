import 'package:flutter/material.dart';
import 'navbar/navigation_menu.dart';

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
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF2196F3),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2196F3),
          secondary: Color(0xFF1976D2),
          surface: Color(0xFF1E1E1E),
        ),
        useMaterial3: true,
      ),
      home: const NavigationMenu(),
    );
  }
}
