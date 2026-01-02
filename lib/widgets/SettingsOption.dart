import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';

class SettingsOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget trailing;

  const SettingsOption({
    super.key,
    required this.title,
    required this.icon,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        trailing: trailing,
        onTap: () {
          // Aucune gestion d'état avancée pour le moment
        },
      ),
    );
  }
}
