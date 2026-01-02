// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatContext _$ChatContextFromJson(Map<String, dynamic> json) => ChatContext(
  source: json['source'] as String,
  chunk: json['chunk'] as String,
  modality: json['modality'] as String,
  score: (json['score'] as num).toDouble(),
);

Map<String, dynamic> _$ChatContextToJson(ChatContext instance) =>
    <String, dynamic>{
      'source': instance.source,
      'chunk': instance.chunk,
      'modality': instance.modality,
      'score': instance.score,
    };
