import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/tags/tag.dart';

import '../core/failure.dart';

abstract class TagsRepository {
  /// this is the only method we have
  /// for tags since tags are expected
  /// to be manipulated in the server-side (directly through firebase)
  /// more methods are expected to be added later
  Stream<Either<Failure, List<Tag>>> watchAllTags();
}
