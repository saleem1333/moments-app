import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/posts/post.dart';

import '../category/category.dart';
import '../core/failure.dart';

abstract class PostsRepository {
  /// watch all posts of all users
  Stream<Either<Failure, List<Post>>> watchAllPosts();

  Stream<Either<Failure, List<Post>>> watchAllPostsByCategory(
      Category cateogory);
  Stream<Either<Failure, List<Post>>> watchAllPostsByTags(PostTags tags);

  /// watch posts for a specific user
  Stream<Either<Failure, List<Post>>> watchAllPostsByUserId(String id);

  /// create new post
  Future<Either<Failure, Unit>> createPost(Post post);

  Future<Either<Failure, Unit>> updatePost(Post post);

  /// delete the given post
  Future<Either<Failure, Unit>> deletePost(Post post);
}
