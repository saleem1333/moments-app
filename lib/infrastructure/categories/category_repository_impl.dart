import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/categories/category_repository.dart';
import 'package:moments_app/domain/categories/category.dart';
import 'package:moments_app/domain/core/failure.dart';
import 'package:moments_app/infrastructure/core/firestore_collections.dart';

import 'category_dto.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final FirebaseFirestore _firestore;

  CategoryRepositoryImpl(this._firestore);
  @override
  Future<Either<Failure, List<Category>>> fetchAllCategories() async {
    return _firestore
        .collection(FirestoreCollections.categories)
        .snapshots()
        .map((snapshot) => right<Failure, List<Category>>(snapshot.docs
            .map((doc) => CateogoryDto.fromJson(doc.data()).toDomain())
            .toList()))
        .handleError((error) => left(Failure(error.toString())))
        .first;
  }

  @override
  Future<Category?> findCategoryByName(CategoryName name) async {
    final ref = _firestore.collection(FirestoreCollections.categories).doc(name
        .getOrCrash()); // since names in categories are unique, we're using them as an id
    final doc = await ref.get();

    if (doc.exists) {
      return CateogoryDto.fromJson(doc.data()!).toDomain();
    }

    return null;
  }
}
