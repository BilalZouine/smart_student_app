import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App Logo/Icon
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.school_rounded,
              size: 48,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 24),

        // App Title
        Center(
          child: Text(
            'Smart Student App',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),

        // Version Badge
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Version 1.0.0',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
