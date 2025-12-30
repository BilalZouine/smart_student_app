import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String routeName;
  final Color? backgroundColor;

  const DrawerItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.routeName,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(leadingIcon, color: AppColors.primary),
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
