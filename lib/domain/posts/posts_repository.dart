import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/posts/post.dart';

import '../category/category.dart';
import '../core/failure.dart';

abstract class PostsRepository {
  /// fetch all posts of all users
  Future<Either<Failure, List<Post>>> fetchAllPosts();

  /// fetch posts by category
  Future<Either<Failure, List<Post>>> fetchAllPostsByCategory(
      Category cateogory);

  /// fetch posts by the given tags   
  Future<Either<Failure, List<Post>>> fetchAllPostsByTags(PostTags tags);

  /// fetch posts for a specific user
  Future<Either<Failure, List<Post>>> fetchAllPostsByUserId(String id);

  /// create new post
  Future<Either<Failure, Unit>> createPost(Post post);

  Future<Either<Failure, Unit>> updatePost(Post post);

  /// delete the given post
  Future<Either<Failure, Unit>> deletePost(Post post);
}
