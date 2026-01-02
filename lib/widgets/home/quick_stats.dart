import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';

class QuickStats extends StatelessWidget {
  const QuickStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.assignment_turned_in_outlined,
              value: '8',
              label: 'Complétés',
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.pending_actions_outlined,
              value: '3',
              label: 'En cours',
              color: Colors.orange,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              icon: Icons.emoji_events_outlined,
              value: '15',
              label: 'Points',
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: color.withOpacity(0.8)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
