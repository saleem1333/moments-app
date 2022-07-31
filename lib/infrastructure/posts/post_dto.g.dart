// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostDto _$$_PostDtoFromJson(Map<String, dynamic> json) => _$_PostDto(
      id: json['id'] as String,
      content: json['content'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: _$JsonConverterFromJson<Object, Timestamp?>(
          json['timestamp'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_PostDtoToJson(_$_PostDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
