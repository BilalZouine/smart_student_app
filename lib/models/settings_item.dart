import 'package:flutter/material.dart';

class SettingsItem {
  final String title;
  final IconData icon;
  final Widget trailing;

  SettingsItem({
    required this.title,
    required this.icon,
    required this.trailing,
  });
}

List<SettingsItem> get settingOptions => [
  SettingsItem(
    title: 'Mode sombred',
    icon: Icons.dark_mode,
    trailing: const Icon(Icons.toggle_off),
  ),
  SettingsItem(
    title: 'Notifications',
    icon: Icons.notifications,
    trailing: const Icon(Icons.toggle_on),
  ),
  SettingsItem(
    title: 'Langue',
    icon: Icons.language,
    trailing: const Text('FR', style: TextStyle(color: Colors.grey)),
  ),
  SettingsItem(
    title: 'Aide',
    icon: Icons.help_outline,
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
  ),
];
