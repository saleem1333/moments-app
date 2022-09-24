import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/core/failure.dart';

import 'category.dart';

abstract class CategoryRepository {
  Stream<Either<Failure, List<Category>>> watchAllCategories();
  Future<Category?> findCategoryByName(CategoryName name);
}
