import 'package:flutter/material.dart';
import 'package:smart_student_app/them/app_colors.dart';
import 'package:smart_student_app/widgets/profile/ProfileAvatar.dart';
import 'package:smart_student_app/widgets/profile/ProfileButton.dart';
import 'package:smart_student_app/widgets/profile/ProfileField.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  String name = "Bilal Zouine";
  String email = "student@example.com";
  String studentId = "ST-2024-001";
  String department = "Informatique";

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
      // Validate before saving
      if (nameController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Le nom ne peut pas être vide'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      setState(() {
        name = nameController.text;
        email = emailController.text;
        isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text('Profil mis à jour avec succès'),
            ],
          ),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    } else {
      setState(() {
        isEditing = true;
      });
    }
  }

  void cancelEditing() {
    setState(() {
      nameController.text = name;
      emailController.text = email;
      isEditing = false;
    });
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
          'Mon Profil',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Avatar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ProfileAvatar(imagePath: "assets/images/BilalZouine.jpg"),
                      if (isEditing)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Information Section
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        isEditing
                            ? 'Modifier les informations'
                            : 'Informations personnelles',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Editable Fields
                  ProfileField(
                    controller: nameController,
                    label: 'Nom complet',
                    icon: Icons.person_outline_rounded,
                    enabled: isEditing,
                  ),
                  const SizedBox(height: 16),
                  ProfileField(
                    controller: emailController,
                    label: 'Adresse e-mail',
                    icon: Icons.email_outlined,
                    enabled: isEditing,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),

                  // Read-only Fields
                  ProfileField(
                    controller: TextEditingController(text: studentId),
                    label: 'Numéro d\'étudiant',
                    icon: Icons.badge_outlined,
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  ProfileField(
                    controller: TextEditingController(text: department),
                    label: 'Département',
                    icon: Icons.school_outlined,
                    enabled: false,
                  ),

                  const SizedBox(height: 32),

                  // Action Buttons
                  if (isEditing)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // Use SizedBox or ConstrainedBox instead of Expanded
                          SizedBox(
                            width: 120, // adjust width as needed
                            child: OutlinedButton(
                              onPressed: cancelEditing,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.textSecondary,
                                side: const BorderSide(color: AppColors.border),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: const Text(
                                'Annuler',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 250, // 2x width for your "flex: 2"
                            child: ProfileButton(
                              isEditing: isEditing,
                              onPressed: toggleEditing,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    ProfileButton(
                      isEditing: isEditing,
                      onPressed: toggleEditing,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
    );
  }
}
