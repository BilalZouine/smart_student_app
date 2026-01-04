import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';
import 'package:smart_student_app/widgets/AppDrawer.dart';
import 'package:smart_student_app/widgets/SettingsOption.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Example state management for settings
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  String selectedLanguage = 'Français';

  void _handleSettingTap(String settingKey) {
    // Handle different setting actions
    switch (settingKey) {
      case 'notifications':
        setState(() {
          notificationsEnabled = !notificationsEnabled;
        });
        _showFeedback(
          'Notifications ${notificationsEnabled ? "activées" : "désactivées"}',
        );
        break;
      case 'dark_mode':
        setState(() {
          darkModeEnabled = !darkModeEnabled;
        });
        _showFeedback('Mode ${darkModeEnabled ? "sombre" : "clair"} activé');
        break;
      case 'language':
        _showLanguageDialog();
        break;
      case 'profile':
        Navigator.pushNamed(context, '/profile');
        break;
      case 'about':
        _showAboutDialog();
        break;
      default:
        _showFeedback('Fonctionnalité à venir');
    }
  }

  void _showFeedback(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choisir la langue'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Français', 'English', 'العربية'].map((lang) {
            return RadioListTile<String>(
              title: Text(lang),
              value: lang,
              groupValue: selectedLanguage,
              activeColor: AppColors.primary,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
                Navigator.pop(context);
                _showFeedback('Langue changée: $value');
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'Smart Student',
      applicationVersion: '1.0.0',
      applicationIcon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.school, color: Colors.white, size: 32),
      ),
      children: [
        const Text('Application de gestion pour étudiants intelligents.'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          'Paramètres',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.border),
        ),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Account Section
          _buildSectionHeader('Compte', Icons.person_outline),
          const SizedBox(height: 12),
          SettingsOption(
            title: 'Mon profil',
            subtitle: 'Gérer vos informations personnelles',
            icon: Icons.account_circle_outlined,
            onTap: () => _handleSettingTap('profile'),
          ),
          const SizedBox(height: 8),
          SettingsOption(
            title: 'Sécurité',
            subtitle: 'Mot de passe et authentification',
            icon: Icons.lock_outline_rounded,
            onTap: () => _handleSettingTap('security'),
          ),

          const SizedBox(height: 24),

          // Preferences Section
          _buildSectionHeader('Préférences', Icons.tune_rounded),
          const SizedBox(height: 12),
          SettingsOption(
            title: 'Notifications',
            subtitle: 'Gérer les alertes et rappels',
            icon: Icons.notifications_outlined,
            trailing: Switch(
              value: notificationsEnabled,
              onChanged: (value) => _handleSettingTap('notifications'),
              activeColor: AppColors.primary,
            ),
            onTap: () => _handleSettingTap('notifications'),
          ),
          const SizedBox(height: 8),
          SettingsOption(
            title: 'Mode sombre',
            subtitle: 'Thème de l\'application',
            icon: Icons.dark_mode_outlined,
            trailing: Switch(
              value: darkModeEnabled,
              onChanged: (value) => _handleSettingTap('dark_mode'),
              activeColor: AppColors.primary,
            ),
            onTap: () => _handleSettingTap('dark_mode'),
          ),
          const SizedBox(height: 8),
          SettingsOption(
            title: 'Langue',
            subtitle: selectedLanguage,
            icon: Icons.language_rounded,
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => _handleSettingTap('language'),
          ),

          const SizedBox(height: 24),

          // App Section
          _buildSectionHeader('Application', Icons.apps_rounded),
          const SizedBox(height: 12),
          SettingsOption(
            title: 'Aide & Support',
            subtitle: 'FAQ et assistance',
            icon: Icons.help_outline_rounded,
            onTap: () => _handleSettingTap('help'),
          ),
          const SizedBox(height: 8),
          SettingsOption(
            title: 'À propos',
            subtitle: 'Version et informations',
            icon: Icons.info_outline_rounded,
            onTap: () => _handleSettingTap('about'),
          ),
          const SizedBox(height: 8),
          SettingsOption(
            title: 'Conditions d\'utilisation',
            subtitle: 'Politique de confidentialité',
            icon: Icons.description_outlined,
            onTap: () => _handleSettingTap('terms'),
          ),

          const SizedBox(height: 24),

          // Logout Button
          _buildLogoutButton(),
          const SizedBox(height: 16),
        ],
      ),
      backgroundColor: AppColors.background,
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
      child: ListTile(
        leading: const Icon(Icons.logout_rounded, color: AppColors.error),
        title: const Text(
          'Déconnexion',
          style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.error,
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text('Déconnexion'),
              content: const Text(
                'Êtes-vous sûr de vouloir vous déconnecter ?',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Annuler'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Handle logout
                    _showFeedback('Déconnexion réussie');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Déconnecter'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
