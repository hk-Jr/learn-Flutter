import 'package:flutter/material.dart';
import '../exercise/exercise_screen.dart';
import '../account/account_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ExerciseScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B), // Very dark background
      body: SafeArea(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: const Color(0xFF00F0FF).withValues(alpha: 0.2), width: 1)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00F0FF).withValues(alpha: 0.1),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: const Color(0xFF16161A), // Dark gray navbar
          selectedItemColor: const Color(0xFF00F0FF), // Neon Cyan accent
          unselectedItemColor: Colors.grey.shade600,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_rounded),
              activeIcon: Icon(Icons.fitness_center_rounded, color: Color(0xFF00F0FF), shadows: [Shadow(color: Color(0xFF00F0FF), blurRadius: 10)]),
              label: 'Exercise',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              activeIcon: Icon(Icons.person_rounded, color: Color(0xFF00F0FF), shadows: [Shadow(color: Color(0xFF00F0FF), blurRadius: 10)]),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
