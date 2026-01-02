import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool enabled;

  const ProfileField({
    super.key,
    required this.controller,
    required this.label,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
