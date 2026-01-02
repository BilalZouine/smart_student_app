import 'package:flutter/material.dart';
import 'package:smart_student_app/models/chat_message.dart';
import 'package:smart_student_app/them/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final String source = "";

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.primary.withOpacity(0.12)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: isUser
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            // Message principal
            Text(
              message.text,
              style: const TextStyle(color: AppColors.textPrimary),
            ),
            // Source (optionnelle)
            if (message.source != null && message.source!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  'La source et ${!message.source!.endsWith(".pdf") ? "l'image: " : "document: "} ${message.source!}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
