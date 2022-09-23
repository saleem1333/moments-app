import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/category/category.dart';
import '../../domain/core/failure.dart';

part 'category_watcher_state.freezed.dart';

@freezed
class CategoryWatcherState with _$CategoryWatcherState {
  const factory CategoryWatcherState.initial() = _Initial;
  const factory CategoryWatcherState.loading() = _Loading;
  const factory CategoryWatcherState.loadedSuccess(List<Category> categories) =
      _LoadedSuccess;
  const factory CategoryWatcherState.loadedFailure(Failure f) = _LoadedFailure;
}
