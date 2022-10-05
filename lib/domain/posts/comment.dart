import 'package:moments_app/domain/app_user/app_user.dart';
import 'package:moments_app/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/core/value_object.dart';
import 'package:moments_app/domain/posts/vote.dart';

class Comment {
  final AppUser user;
  final CommentBody body;
  final CommentVotes votes;
  // subcomments are not supported for now

  Comment({required this.user, required this.body, required this.votes});
}

class CommentBody extends ValueObject<String> {
  CommentBody(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    if (value.isEmpty) {
      return left(Failure("Comment cannot be empty"));
    }
    return right(value);
  }
}

class CommentVotes extends ValueObject<List<Vote>> {
  CommentVotes(List<Vote> value) : super(value);

  @override
  Either<Failure, List<Vote>> validate() {
    return right(value);
  }
}
