import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/posts/post.dart';

import '../core/failure.dart';

abstract class PostsRepository {
  /// watch all posts of all users
  Stream<Either<Failure, List<Post>>> watchAllPosts();



  /// watch posts for a specific user
  Stream<Either<Failure, List<Post>>> watchAllPostsByUserId(String id);

  /// create new post
  Future<Either<Failure, Unit>> createPost(Post post);

  Future<Either<Failure, Unit>> updatePost(Post post);

  /// delete the given post
  Future<Either<Failure, Unit>> deletePost(Post post);
}
