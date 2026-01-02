// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) => ChatResponse(
  message: json['response'] as String,
  context: (json['context'] as List<dynamic>?)
      ?.map((e) => ChatContext.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'response': instance.message,
      'context': instance.context,
    };
