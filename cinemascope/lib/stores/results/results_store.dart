import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../global/enums.dart';
import '../../global/utils.dart';
import '../../repositories/tmdb/tmdb_repository.dart';

export '../../global/enums.dart';

part 'discover_movies_store.dart';
part 'results_store.g.dart';
part 'trending_store.dart';

abstract class ResultsStore<T extends TResultsObject> = _ResultsStore<T> with _$ResultsStore;

abstract class _ResultsStore<T extends TResultsObject> with Store {
  _ResultsStore({bool autoFetch = true}) {
    if (autoFetch) {
      fetchResults();
    }
  }

  final TmdbRepository _repository = TmdbRepository();

  @observable
  FetchState state = FetchState.initial;

  @computed
  bool get isEmpty => state == FetchState.empty;

  @computed
  bool get isLoading => state == FetchState.loading;

  @computed
  bool get isLoadingNextPage => state == FetchState.loadingNextPage;

  @computed
  bool get isLoaded => state == FetchState.loaded;

  @observable
  T results;

  @action
  void _setResults(T value) => results = value;

  Future<void> fetchResults() async {
    state = FetchState.loading;
    _setResults(await _fetch());
    state = FetchState.loaded;
  }

  Future<void> fetchResultsNextPage() async {
    _setResults(await _fetchNextPage());
    state = FetchState.loaded;
  }

  Future<T> _fetch();

  Future<T> _fetchNextPage();
}
