import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/categories/category.dart';
import '../../domain/categories/category_repository.dart';
import '../../domain/core/failure.dart';
import 'categories_fetcher_state.dart';

class CategoriesFetcherCubit extends Cubit<CategoriesFetcherState> {
  CategoriesFetcherCubit(this._categoryRepository)
      : super(CategoriesFetcherState.initial());

  final CategoryRepository _categoryRepository;

  Future<void> fetchAllCategories() async {
    emit(CategoriesFetcherState.loading());

    Either<Failure, List<Category>> eitherFailureOrCategories =
        await _categoryRepository.fetchAllCategories();

    emit(eitherFailureOrCategories.fold(
        (f) => CategoriesFetcherState.loadedFailure(f),
        (categories) => CategoriesFetcherState.loadedSuccess(categories)));
  }
}
