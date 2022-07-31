import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moments_app/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/infrastructure/core/firestore_collections.dart';
import 'package:moments_app/infrastructure/posts/post_dto.dart';
import '../../domain/posts/post.dart';
import '../../domain/posts/posts_repository.dart';
import '../core/firebase_firestore_mapper.dart';

class PostsRepositoryImpl implements PostsRepository {
  final FirebaseFirestore _firestore;

  PostsRepositoryImpl(this._firestore);

  @override
  Stream<Either<Failure, List<Post>>> watchAllPosts() async* {
    yield* _firestore
        .userDoc()
        .collection(FirestoreCollections.posts)
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
          .collection(FirestoreCollections.posts)
          .doc(postDto.id)
          .set(postDto.toJson());
      return right(unit);
    } on Exception catch (e) {
      log(e.toString());
      return left(const Failure("Couldn't create the post"));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final postDto = PostDto.fromDomain(post);
    try {
      await _firestore
          .userDoc()
          .collection(FirestoreCollections.posts)
          .doc(postDto.id)
          .update(postDto.toJson());
      return right(unit);
    } on Exception {
      return left(const Failure("Updating post failed!"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(Post post) async {
    final postDto = PostDto.fromDomain(post);
    try {
      await _firestore
          .userDoc()
          .collection(FirestoreCollections.posts)
          .doc(postDto.id)
          .delete();
      return right(unit);
    } on Exception {
      return left(const Failure("Deleting post failed!"));
    }
  }
}
