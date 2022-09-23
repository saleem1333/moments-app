import 'package:moments_app/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/core/value_object.dart';

class Category {
  CategoryName name;

  Category({required this.name});
}

class CategoryName extends ValueObject<String> {
  CategoryName(String value) : super(value);

  @override
  Either<Failure, String> validate() {
    return right(value);
  }
}
