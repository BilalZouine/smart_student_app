import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';
import 'package:smart_student_app/widgets/about/about_footer.dart';
import 'package:smart_student_app/widgets/about/app_header.dart';
import 'package:smart_student_app/widgets/about/info_card.dart';
import 'package:smart_student_app/widgets/about/section_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: const Text('À propos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(),
            const SizedBox(height: 32),

            // Description Card
            SectionCard(
              child: Text(
                'Smart Student App est une application mobile conçue pour aider '
                'les étudiants à organiser leur apprentissage, accéder à des '
                'fonctionnalités intelligentes et interagir avec un chatbot '
                'basé sur une API.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),

            // Technical Info Section
            Text(
              'Informations techniques',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const InfoCard(
              icon: Icons.code_rounded,
              title: 'Technologies',
              value: 'Flutter, Retrofit, Dio',
            ),
            const SizedBox(height: 12),

            const InfoCard(
              icon: Icons.architecture_rounded,
              title: 'Architecture',
              value: 'UI + API REST',
            ),
            const SizedBox(height: 12),

            const InfoCard(
              icon: Icons.devices_rounded,
              title: 'Plateformes',
              value: 'Android, iOS',
            ),
            const SizedBox(height: 40),

            // Footer
            const AboutFooter(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
