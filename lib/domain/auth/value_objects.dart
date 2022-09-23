import 'package:email_validator/email_validator.dart';
import 'package:moments_app/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/core/value_object.dart';

class EmailAddress extends ValueObject<String> {
  EmailAddress(String value) : super(value);

  @override
  Either<Failure, String> validate() {

    if (EmailValidator.validate(value)) {
      return right(value);
    }
    return left(Failure("Invalid email"));
  }
}

class Password extends ValueObject<String> {
  Password(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    if (value.length >= 5) {
      return right(value);
    }

    return left(Failure("Password is too short"));
  }
}
