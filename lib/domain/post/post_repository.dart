import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/post/post.dart';

import '../core/failure.dart';

abstract class PostRepository {
  /// watch all posts
  Stream<Either<Failure, List<Post>>> watchAllPosts();

  /// create new post
  Future<Either<Failure, Unit>> createPost(Post post);

  /// QUESTION: Do we need an update method? is the post supposed to be updateable/editeble?

  /// delete the given post
  Future<Either<Failure, Unit>> deletePost(Post post);
}
