import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
            ),
            backgroundColor: Color(0xFF1E1E1E),
          ),
          const SizedBox(height: 15),
          const Text(
            'Alex Johnson',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'alex.johnson@example.com',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          // User stats row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatItem(label: 'Workouts', value: '18'),
                _VerticalDivider(),
                _StatItem(label: 'Streak', value: '5 days'),
                _VerticalDivider(),
                _StatItem(label: 'Kcal Burned', value: '4.2k'),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Options List
          Expanded(
            child: ListView(
              children: [
                _buildMenuOption(
                  icon: Icons.person_outline_rounded,
                  title: 'Edit Profile',
                ),
                const SizedBox(height: 12),
                _buildMenuOption(
                  icon: Icons.history_rounded,
                  title: 'Activity History',
                ),
                const SizedBox(height: 12),
                _buildMenuOption(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                ),
                const SizedBox(height: 12),
                _buildMenuOption(
                  icon: Icons.help_outline_rounded,
                  title: 'Help & Support',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption({required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2196F3)),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 16),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF2196F3),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white10,
    );
  }
}
