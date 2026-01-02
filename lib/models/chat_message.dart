class ChatMessage {
  final String text;
  final bool isUser;
  final String? source;
  const ChatMessage({required this.text, required this.isUser, this.source});
}
