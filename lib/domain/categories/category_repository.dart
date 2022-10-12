import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/core/failure.dart';

import 'category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> fetchAllCategories();
  Future<Category?> findCategoryByName(CategoryName name);
}
