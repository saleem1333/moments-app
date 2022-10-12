import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moments_app/domain/app_user/app_user_repository.dart';
import 'package:moments_app/domain/category/category.dart';
import 'package:moments_app/domain/category/category_repository.dart';
import 'package:moments_app/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moments_app/infrastructure/core/firestore_collections.dart';
import 'package:moments_app/infrastructure/posts/post_dto.dart';
import '../../domain/posts/post.dart';
import '../../domain/posts/posts_repository.dart';
import '../core/firebase_firestore_mapper.dart';

class PostsRepositoryImpl implements PostsRepository {
  final FirebaseFirestore _firestore;
  final AppUserRepository _appUserRepository;
  final CategoryRepository _cateogoryRepository;

  PostsRepositoryImpl(
      this._firestore, this._appUserRepository, this._cateogoryRepository);

  @override
  Future<Either<Failure, List<Post>>> fetchAllPosts() async {
    return _firestore
        .collectionGroup(FirestoreCollections.posts)
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snapshot) => right<Failure, Future<List<Post>>>(
                Stream.fromIterable(snapshot.docs).asyncMap((doc) async {
              // getting the user of the post

              final user = await _appUserRepository
                  .getUserById(doc.reference.parent.parent!.id);

              return PostDto.fromJson(doc.data())
                  .toDomain(user.getOrElse(() => throw Error()));
            }).toList()))
        .handleError((e) => left(Failure(e.toString())))
        .asyncMap<Either<Failure, List<Post>>>((snapshot) async =>
            snapshot.fold((l) => left(l), (r) async => right(await r)))
        .first;
  }

  @override
  Future<Either<Failure, List<Post>>> fetchAllPostsByCategory(
      Category category) async {
    final fetchedCategory =
        await _cateogoryRepository.findCategoryByName(category.name);
    if (fetchedCategory == null) {
      return left<Failure, List<Post>>(
          const Failure("The given category doesn't exist"));
    } else {
      return _firestore
          .collectionGroup(FirestoreCollections.posts)
          .where("category.name", isEqualTo: category.name.getOrCrash())
          .orderBy("timestamp", descending: true)
          .snapshots()
          .map((snapshot) => right<Failure, Future<List<Post>>>(
                  Stream.fromIterable(snapshot.docs).asyncMap((doc) async {
                // getting the user of the post
                final user = await _appUserRepository
                    .getUserById(doc.reference.parent.parent!.id);

                return PostDto.fromJson(doc.data())
                    .toDomain(user.getOrElse(() => throw Error()));
              }).toList()))
          .handleError((e) => left(Failure(e.toString())))
          .asyncMap<Either<Failure, List<Post>>>((snapshot) async =>
              snapshot.fold((l) => left(l), (r) async => right(await r)))
          .first;
    }
  }

  /// NOTE: THIS METHOD HAS NOT BEEN TESTED YET
  @override
  Future<Either<Failure, List<Post>>> fetchAllPostsByTags(PostTags tags) async {
    Iterable<String> tagNames =
        tags.getOrCrash().map((tag) => tag.name.getOrCrash());
    Either<Failure, List<Post>> eitherFailureOrPosts = await fetchAllPosts();
    return eitherFailureOrPosts.fold(
        (l) => left(l),
        (posts) => right(posts.where((post) {
              Iterable<String> postTagNames =
                  post.tags.getOrCrash().map((tag) => tag.name.getOrCrash());
              return tagNames.every((name) => postTagNames.contains(name));
            }).toList()));
  }

  /// NOTE: THIS METHOD HAS NOT BEEN TESTED YET
  @override
  Future<Either<Failure, List<Post>>> fetchAllPostsByUserId(String id) async {
    return _firestore
        .collection(FirestoreCollections.users)
        .doc(id)
        .collection(FirestoreCollections.posts)
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snapshot) => right<Failure, Future<List<Post>>>(
                Stream.fromIterable(snapshot.docs).asyncMap((doc) async {
              final user = await _appUserRepository.getUserById(id);
              return PostDto.fromJson(doc.data())
                  .toDomain(user.getOrElse(() => throw Error()));
            }).toList()))
        .handleError((error) => left(Failure(error.toString())))
        .asyncMap<Either<Failure, List<Post>>>((snapshot) async =>
            snapshot.fold((l) => left(l), (r) async => right(await r)))
        .first;
  }

  @override
  Future<Either<Failure, Unit>> createPost(Post post) async {
    final category =
        await _cateogoryRepository.findCategoryByName(post.category.name);

    if (category == null) {
      return left(Failure("Creating post failed! category doesn't exist."));
    }

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
