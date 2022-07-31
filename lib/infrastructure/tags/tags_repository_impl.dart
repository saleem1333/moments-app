import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/tags/tag.dart';
import 'package:moments_app/infrastructure/tags/tag_dto.dart';

import '../../domain/core/failure.dart';
import '../../domain/tags/tags_repository.dart';
import '../core/firestore_collections.dart';

class TagsRepositoryImpl implements TagsRepository {
  TagsRepositoryImpl(this._firestore);

  final FirebaseFirestore _firestore;
  @override
  Stream<Either<Failure, List<Tag>>> watchAllTags() async* {
    yield* _firestore
        .collection(FirestoreCollections.tags)
        .snapshots()
        .map((snapshot) => right<Failure, List<Tag>>(snapshot.docs
            .map((doc) => TagDto.fromJson(doc.data()).toDomain())
            .toList()))
        .handleError((error) => left(Failure(error.toString())));
  }
}
