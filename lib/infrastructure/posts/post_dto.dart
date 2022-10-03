import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/infrastructure/category/category_dto.dart';
import 'package:moments_app/infrastructure/posts/vote_dto.dart';
import 'package:moments_app/infrastructure/tags/tag_dto.dart';

import '../../domain/app_user/app_user.dart';
import '../../domain/posts/post.dart';
import 'comment_dto.dart';
part 'post_dto.g.dart';
part 'post_dto.freezed.dart';

@freezed
class PostDto with _$PostDto {
  const PostDto._();

  @JsonSerializable(explicitToJson: true)
  const factory PostDto(
      {required String id,
      required String content,
      required CateogoryDto category,
      required List<TagDto> tags,
      required List<VoteDto> votes,
      required List<CommentDto> comments,
      @TimestampConverter() required Timestamp? timestamp}) = _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
  factory PostDto.fromDomain(Post post) => PostDto(
      id: post.id,
      content: post.content.getOrCrash(),
      category: CateogoryDto.fromDomain(post.category),
      tags:
          post.tags.getOrCrash().map((tag) => TagDto.fromDomain(tag)).toList(),
      votes: post.votes
          .getOrCrash()
          .map((vote) => VoteDto.fromDomain(vote))
          .toList(),
      comments: post.comments
          .getOrCrash()
          .map((comment) => CommentDto.fromDomain(comment))
          .toList(),
      timestamp:
          post.createdAt == null ? null : Timestamp.fromDate(post.createdAt!));

  /// since AppUser isn't supposed to be stored twice, AppUser is fetched from the database and get passed in here
  Post toDomain(AppUser? user) {
    return Post(
        id: id,
        appUser: user,
        content: PostBody(content),
        createdAt: timestamp!.toDate(),
        category: category.toDomain(),
        tags: PostTags(tags.map((dto) => dto.toDomain()).toList()),
        votes: PostVotes(votes.map((vote) => vote.toDomain()).toList()),
        comments: PostComments(
            comments.map((comment) => comment.toDomain()).toList()));
  }
}

class TimestampConverter implements JsonConverter<Timestamp?, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object object) {
    // object is guaranteed to be a timestamp instance
    return object as Timestamp;
  }

  @override
  Object toJson(Timestamp? timestamp) {
    // if timestamp were null, a token is sent to the server to create a new timestamp instance at the server level
    return timestamp ?? FieldValue.serverTimestamp();
  }
}
