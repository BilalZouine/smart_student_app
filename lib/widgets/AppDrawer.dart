import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';
import 'package:smart_student_app/widgets/DrawerItem.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header avec avatar, nom et email
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "assets/images/BilalZouine.jpg",
                  ), // Remplacer par ton image
                ),
                const SizedBox(height: 10),
                Text(
                  'Bilal Zouine', // Nom étudiant
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  'bilal.zouine.dev@gmail.com', // Email étudiant
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          // Navigation
          const DrawerItem(
            leadingIcon: Icons.person,
            title: 'Profil',
            routeName: '/profile',
          ),
          const DrawerItem(
            leadingIcon: Icons.settings,
            title: 'Paramètres',
            routeName: '/settings',
          ),
          const DrawerItem(
            leadingIcon: Icons.info,
            title: 'À propos',
            routeName: '/about',
          ),
          const DrawerItem(
            leadingIcon: Icons.chat,
            title: 'Chatbot',
            routeName: '/chatbot',
          ),
        ],
      ),
    );
  }
}
