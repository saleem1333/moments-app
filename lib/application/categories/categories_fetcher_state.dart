import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/categories/category.dart';
import '../../domain/core/failure.dart';

part 'categories_fetcher_state.freezed.dart';

@freezed
class CategoriesFetcherState with _$CategoriesFetcherState {
  const factory CategoriesFetcherState.initial() = _Initial;
  const factory CategoriesFetcherState.loading() = _Loading;
  const factory CategoriesFetcherState.loadedSuccess(
      List<Category> categories) = _LoadedSuccess;
  const factory CategoriesFetcherState.loadedFailure(Failure f) =
      _LoadedFailure;
}
