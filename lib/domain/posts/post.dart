import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/core/failure.dart';

import '../core/value_object.dart';
import '../tags/tag.dart';

class Post {
  final String id;
  final PostBody content;
  final DateTime? createdAt;
  final PostTags tags;

  Post(
      {required this.id,
      required this.content,
      required this.createdAt,
      required this.tags});
}

class PostBody extends ValueObject<String> {
  static const int minSize = 60;
  static const int maxSize = 200;

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
