import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';
import 'package:smart_student_app/widgets/ProfileAvatar.dart';
import 'package:smart_student_app/widgets/ProfileButton.dart';
import 'package:smart_student_app/widgets/ProfileField.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  String name = "Bilal Zouine";
  String email = "student@example.com";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    emailController.text = email;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void toggleEditing() {
    if (isEditing) {
      setState(() {
        name = nameController.text;
        email = emailController.text;
        isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informations mises à jour !'),
          backgroundColor: AppColors.success,
        ),
      );
    } else {
      setState(() {
        isEditing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title: const Text('Profil'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          children: [
            ProfileAvatar(imagePath: "assets/images/BilalZouine.jpg"),
            const SizedBox(height: 20),
            ProfileField(
              controller: nameController,
              label: 'Nom',
              enabled: isEditing,
            ),
            const SizedBox(height: 15),
            ProfileField(
              controller: emailController,
              label: 'Email',
              enabled: isEditing,
            ),
            const SizedBox(height: 30),
            ProfileButton(isEditing: isEditing, onPressed: toggleEditing),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
    );
  }
}
