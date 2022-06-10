import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'failure.dart';

/// a ValueObject is a class that handles validation
/// any class that has validation logic should extend this class
abstract class ValueObject<Value> {
  late final Value _value;
  late final Either<Failure, Value> failureOrValue;

  ValueObject(Value value) {
    _value = value;
    failureOrValue = validate();
  }

  @protected
  Value get value => _value;

  bool isValid() => failureOrValue.isRight();

  /// Get the value if it is valid; otherwise crash the app
  /// this method should not be called unless the ValueObject is valid
  Value getOrCrash() => failureOrValue.getOrElse(() => throw Error());

  // validate this; return the Value if valid otherwise return Failure
  Either<Failure, Value> validate();
}
