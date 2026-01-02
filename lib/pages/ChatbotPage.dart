import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_student_app/models/chat_message.dart';
import 'package:smart_student_app/services/chat_service.dart';
import 'package:smart_student_app/widgets/chatbot/chat_bubble.dart';
import 'package:smart_student_app/widgets/chatbot/chati_nput.dart';
import 'package:smart_student_app/widgets/chatbot/typing_indicator.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  late final ChatService _chatService;
  Future<ChatMessage>? _pendingMessage;

  @override
  void initState() {
    super.initState();
    _messages.add(
      ChatMessage(text: "Bonjour 👋 Je suis ton assistant.", isUser: false),
    );
    _chatService = ChatService(Dio());
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<ChatMessage> _fetchBotResponse(String query) async {
    try {
      final response = await _chatService.sendMessage({"query": query});
      final source = response.context?.isNotEmpty == true
          ? response.context![0].source?.split("\\")[1]
          : null;

      return ChatMessage(text: response.message, isUser: false, source: source);
    } catch (e) {
      return const ChatMessage(
        text: "Erreur : impossible de contacter le serveur.",
        isUser: false,
      );
    }
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty || _pendingMessage != null) return;

    // Ajouter le message de l'utilisateur
    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _controller.clear();
      _pendingMessage = _fetchBotResponse(text);
    });

    _scrollToBottom();
  }

  void _onMessageReceived(ChatMessage message) {
    setState(() {
      _messages.add(message);
      _pendingMessage = null;
    });
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: const Text("Chatbot"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length + (_pendingMessage != null ? 1 : 0),
              itemBuilder: (_, index) {
                // Si c'est le dernier item et qu'il y a un message en attente
                if (index == _messages.length && _pendingMessage != null) {
                  return FutureBuilder<ChatMessage>(
                    future: _pendingMessage,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const TypingIndicator();
                      } else if (snapshot.hasError) {
                        // En cas d'erreur, ajouter le message d'erreur
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _onMessageReceived(
                            const ChatMessage(
                              text:
                                  "Erreur : impossible de contacter le serveur.",
                              isUser: false,
                            ),
                          );
                        });
                        return const SizedBox.shrink();
                      } else if (snapshot.hasData) {
                        // Ajouter le message reçu
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _onMessageReceived(snapshot.data!);
                        });
                        return const SizedBox.shrink();
                      }
                      return const SizedBox.shrink();
                    },
                  );
                }

                return ChatBubble(message: _messages[index]);
              },
            ),
          ),
          ChatInput(
            controller: _controller,
            onSend: _sendMessage,
            isLoading: _pendingMessage != null,
          ),
        ],
      ),
    );
  }
}
