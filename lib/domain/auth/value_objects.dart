import 'package:moments_app/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/core/value_object.dart';

class EmailAddress extends ValueObject<String> {
  EmailAddress(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    // TODO: Validate the email
    throw UnimplementedError();
  }
}

class Password extends ValueObject<String> {
  Password(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    // TODO: Validate the password

    throw UnimplementedError();
  }
}
