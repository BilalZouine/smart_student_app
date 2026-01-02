import 'package:json_annotation/json_annotation.dart';

part 'chat_context.g.dart';

@JsonSerializable()
class ChatContext {
  final String source;
  final String chunk;
  final String modality;
  final double score;

  ChatContext({
    required this.source,
    required this.chunk,
    required this.modality,
    required this.score,
  });

  factory ChatContext.fromJson(Map<String, dynamic> json) =>
      _$ChatContextFromJson(json);

  Map<String, dynamic> toJson() => _$ChatContextToJson(this);
}
