import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/category/category_repository.dart';
import 'category_watcher_state.dart';

class CategoryWatcherCubit extends Cubit<CategoryWatcherState> {
  CategoryWatcherCubit(this._categoryRepository)
      : super(CategoryWatcherState.initial());

  final CategoryRepository _categoryRepository;

  StreamSubscription? _streamSubscription;

  void startWatchCategories() {
    emit(CategoryWatcherState.loading());
    _streamSubscription?.cancel();
    _streamSubscription =
        _categoryRepository.watchAllCateogories().listen((categoriesOrFailure) {
      emit(categoriesOrFailure.fold(
          (f) => CategoryWatcherState.loadedFailure(f),
          (categories) => CategoryWatcherState.loadedSuccess(categories)));
    });
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
