import 'package:flutter/material.dart';
import 'package:smart_student_app/pages/ChatbotPage.dart';
import 'package:smart_student_app/pages/HomePage.dart';
import 'package:smart_student_app/pages/ProfilePage.dart';
import 'package:smart_student_app/pages/about_page.dart';
import 'package:smart_student_app/pages/settingsPage.dart';
import 'package:smart_student_app/them/app_them.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Flutter Demo',
      // home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/about': (context) => const AboutPage(),
        '/chatbot': (context) => const ChatbotPage(),
      },
    );
  }
}
