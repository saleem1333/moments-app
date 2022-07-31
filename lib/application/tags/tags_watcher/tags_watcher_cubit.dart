import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/tags/tags_watcher/tags_watcher_state.dart';
import 'package:moments_app/domain/tags/tags_repository.dart';

class TagsWatcherCubit extends Cubit<TagsWatcherState> {
  TagsWatcherCubit(this._tagsRepository)
      : super(const TagsWatcherState.initial());

  final TagsRepository _tagsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> watchAllStarted() async {
    emit(const TagsWatcherState.loading());
    await _streamSubscription?.cancel();
    _streamSubscription =
        _tagsRepository.watchAllTags().listen((failureOrTags) {
      emit(failureOrTags.fold((f) => TagsWatcherState.loadedFailure(f),
          (tags) => TagsWatcherState.loadedSuccess(tags)));
    });
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
