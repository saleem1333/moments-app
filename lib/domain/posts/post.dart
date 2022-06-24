import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/core/failure.dart';

import '../core/value_object.dart';

class Post {
  final String id;
  final PostBody content;

  Post({required this.id, required this.content});
}

class PostBody extends ValueObject<String> {
  static const int minSize = 60;
  static const int maxSize = 200;

  PostBody(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    if (value.length < maxSize) return left(const Failure("Post is too short"));
    if (value.length > minSize) return left(const Failure("Post is too long"));

    return right(value);
  }
}
