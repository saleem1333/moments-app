import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/infrastructure/tags/tag_dto.dart';

import '../../domain/posts/post.dart';
part 'post_dto.g.dart';
part 'post_dto.freezed.dart';

@freezed
class PostDto with _$PostDto {
  const PostDto._();

  @JsonSerializable(explicitToJson: true)
  const factory PostDto(
      {required String id,
      required String content,
      required List<TagDto> tags,
      @TimestampConverter() required Timestamp? timestamp}) = _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
  factory PostDto.fromDomain(Post post) => PostDto(
      id: post.id,
      content: post.content.getOrCrash(),
      tags:
          post.tags.getOrCrash().map((tag) => TagDto.fromDomain(tag)).toList(),
      timestamp:
          post.createdAt == null ? null : Timestamp.fromDate(post.createdAt!));
  Post toDomain() {
    return Post(
        id: id,
        content: PostBody(content),
        createdAt: timestamp!.toDate(),
        tags: PostTags(tags.map((dto) => dto.toDomain()).toList()));
  }
}

class TimestampConverter implements JsonConverter<Timestamp?, Object> {
  const TimestampConverter();

  @override
  Timestamp? fromJson(Object object) {
    // object is guaranteed to be a timestamp instance
    return object as Timestamp;
  }

  @override
  Object toJson(Timestamp? timestamp) {
    // if timestamp were null, a token is sent to the server to create a new timestamp instance at the server level
    return timestamp ?? FieldValue.serverTimestamp();
  }
}
