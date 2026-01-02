import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';

class ProfileButton extends StatelessWidget {
  final bool isEditing;
  final VoidCallback onPressed;

  const ProfileButton({
    super.key,
    required this.isEditing,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        child: Text(isEditing ? 'Enregistrer' : 'Modifier'),
      ),
    );
  }
}
