import 'package:moments_app/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/core/value_object.dart';

class Tag {
  final String id;
  final TagName name;
  const Tag({required this.id, required this.name});
}

class TagName extends ValueObject<String> {
  TagName(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    // for now the only validation is just for the tag not to be empty
    if (value.isEmpty) {
      return left(const Failure("Tag's name shouldn't be empty!"));
    }
    return right(value);
  }
}
