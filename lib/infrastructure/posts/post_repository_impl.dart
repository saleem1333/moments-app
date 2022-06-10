import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moments_app/domain/post/post.dart';
import 'package:moments_app/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/post/post_repository.dart';
import 'package:moments_app/infrastructure/posts/post_dto.dart';
import '../core/firebase_firestore_mapper.dart';

class PostRepositoryImpl implements PostRepository {
  final FirebaseFirestore _firestore;

  PostRepositoryImpl(this._firestore);

  @override
  Stream<Either<Failure, List<Post>>> watchAllPosts() async* {
    yield* _firestore
        .userDoc()
        .collection("posts")
        .snapshots()
        .map((snapshot) => right<Failure, List<Post>>(snapshot.docs
            .map((doc) => PostDto.fromJson(doc.data()).toDomain())
            .toList()))
        .handleError((error) => left(Failure(error.toString())));
  }

  @override
  Future<Either<Failure, Unit>> createPost(Post post) async {
    final postDto = PostDto.fromDomain(post);
    try {
      await _firestore
          .userDoc()
          .collection("posts")
          .doc(postDto.id)
          .set(postDto.toJson());
      return right(unit);
    } on Exception catch (e) {
      log(e.toString());
      return left(const Failure("couldn't create the post! Please try again later"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(Post post) {
    throw UnimplementedError();
  }
}
