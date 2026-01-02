import 'package:flutter/material.dart';
import 'package:smart_student_app/widgets/AppDrawer.dart';
import 'package:smart_student_app/widgets/home/feature_card.dart';
import 'package:smart_student_app/widgets/home/quick_stats.dart';
import 'package:smart_student_app/widgets/home/welcome_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeHeader(),
            const SizedBox(height: 24),

            const QuickStats(),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Fonctionnalités',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  FeatureCard(
                    icon: Icons.chat_bubble_outline,
                    title: 'Chatbot Intelligent',
                    description:
                        'Posez vos questions et obtenez des réponses instantanées',
                    color: Colors.blue,
                    onTap: () {
                      Navigator.pushNamed(context, '/chatbot');
                    },
                  ),
                  const SizedBox(height: 12),

                  FeatureCard(
                    icon: Icons.calendar_today_outlined,
                    title: 'Emploi du temps',
                    description: 'Gérez votre planning et vos cours',
                    color: Colors.purple,
                    onTap: () {
                      // TODO: Navigate to schedule
                    },
                  ),
                  const SizedBox(height: 12),

                  FeatureCard(
                    icon: Icons.assignment_outlined,
                    title: 'Devoirs',
                    description: 'Suivez vos devoirs et projets',
                    color: Colors.orange,
                    onTap: () {
                      // TODO: Navigate to assignments
                    },
                  ),
                  const SizedBox(height: 12),

                  FeatureCard(
                    icon: Icons.library_books_outlined,
                    title: 'Ressources',
                    description: 'Accédez à vos documents et notes',
                    color: Colors.green,
                    onTap: () {
                      // TODO: Navigate to resources
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
