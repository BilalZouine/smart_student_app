import 'package:flutter/material.dart';
import 'package:smart_student_app/models/settings_item.dart';
import 'package:smart_student_app/them/app_colors.dart';
import 'package:smart_student_app/widgets/AppDrawer.dart';
import 'package:smart_student_app/widgets/SettingsOption.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: const Text('Paramètres'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: settingOptions.length,
        itemBuilder: (context, index) {
          final item = settingOptions[index];
          return Column(
            children: [
              SettingsOption(
                title: item.title,
                icon: item.icon,
                trailing: item.trailing,
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
