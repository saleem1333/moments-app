import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/categories/category.dart';
import 'package:moments_app/domain/core/failure.dart';
import 'package:moments_app/domain/posts/comment.dart';
import 'package:moments_app/domain/posts/vote.dart';

import '../app_user/app_user.dart';
import '../core/value_object.dart';
import '../tags/tag.dart';

class Post {
  // it really doesn't make sense for the appUser to be nullable since every post has a poster but it is really essential to do that for the time being
  // due to not knowing the user when the applciation layer instantiates a new Post
  final String id;
  final AppUser? appUser;
  final PostBody content;
  final DateTime? createdAt;
  final Category category;
  final PostTags tags;
  final PostVotes votes;
  final PostComments comments;
  Post(
      {required this.id,
      required this.appUser,
      required this.content,
      required this.createdAt,
      required this.category,
      required this.tags,
      required this.votes,
      required this.comments});
}

class PostBody extends ValueObject<String> {
  static const int minSize = 10;
  static const int maxSize = 10000;

  PostBody(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    if (value.length < minSize) return left(const Failure("Post is too short"));
    if (value.length > maxSize) return left(const Failure("Post is too long"));

    return right(value);
  }
}

class PostTags extends ValueObject<List<Tag>> {
  PostTags(List<Tag> value) : super(value);

  @override
  Either<Failure, List<Tag>> validate() {
    if (value.isEmpty) {
      return left(const Failure("At least one tag must be selected"));
    }
    return right(value);
  }
}

class PostVotes extends ValueObject<List<Vote>> {
  PostVotes(List<Vote> value) : super(value);

  @override
  Either<Failure, List<Vote>> validate() {
    return right(value);
  }
}

class PostComments extends ValueObject<List<Comment>> {
  PostComments(List<Comment> value) : super(value);

  @override
  Either<Failure, List<Comment>> validate() {
    return right(value);
  }
}
