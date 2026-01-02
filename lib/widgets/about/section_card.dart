import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';

class SectionCard extends StatelessWidget {
  final Widget child;

  const SectionCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withOpacity(0.5)),
      ),
      child: child,
    );
  }
}
