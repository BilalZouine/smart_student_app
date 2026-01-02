import 'package:json_annotation/json_annotation.dart';
import 'package:smart_student_app/models/chat_context.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse {
  @JsonKey(name: 'response')
  final String message;

  final List<ChatContext>? context;

  ChatResponse({required this.message, this.context});

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
