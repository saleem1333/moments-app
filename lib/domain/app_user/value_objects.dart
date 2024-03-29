import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../core/failure.dart';
import '../core/value_object.dart';

class Username extends ValueObject<String> {
  Username(String value) : super(value);

  static const int minSize = 3;
  static const int maxSize = 9;

  @override
  Either<Failure, String> validate() {
    if (value.length < minSize) {
      return left(const Failure("Username is too short"));
    }
    if (value.length > maxSize) {
      return left(const Failure("Username is too long"));
    }

    return right(value);
  }
}

class UserProfileImage extends ValueObject<Uint8List> {
  UserProfileImage(Uint8List value) : super(value);

  @override
  Either<Failure, Uint8List> validate() {
    return right(value);
  }
}
