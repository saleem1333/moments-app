import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/post/post.dart';
part 'post_dto.g.dart';
part 'post_dto.freezed.dart';

@freezed
class PostDto with _$PostDto {
  const PostDto._();
  const factory PostDto({required String id, required String content}) =
      _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
  factory PostDto.fromDomain(Post post) =>
      PostDto(id: post.id, content: post.content.getOrCrash());
  Post toDomain() {
    return Post(id: id, content: PostBody(content));
  }
}
