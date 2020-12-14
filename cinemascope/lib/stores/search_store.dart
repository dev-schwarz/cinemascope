import 'package:mobx/mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../repositories/tmdb/tmdb_repository.dart';

part 'search_store.g.dart';

class SearchSuggestionsStore = _SearchSuggestionsStore with _$SearchSuggestionsStore;

abstract class _SearchSuggestionsStore with Store {
  final TmdbRepository _repository = TmdbRepository();

  String _currentQuery;

  SearchMulti suggestions;

  @observable
  ObservableFuture<SearchMulti> fetchSuggestionsFuture = _emptySuggestions;

  @computed
  bool get hasSuggestions =>
      fetchSuggestionsFuture != _emptySuggestions &&
      fetchSuggestionsFuture.status == FutureStatus.fulfilled;

  @action
  Future<SearchMulti> fetchSuggestions(String query) async {
    if (query == _currentQuery) {
      return Future.value(null);
    }

    _currentQuery = query;
    suggestions = null;
    final future = _repository.api.search.multiSearch(
      _currentQuery,
      language: TmdbConfig.language.language,
      region: TmdbConfig.region.region,
      includeAdult: TmdbConfig.includeAdult,
    );
    fetchSuggestionsFuture = ObservableFuture(future);

    return suggestions = await future;
  }

  static ObservableFuture<SearchMulti> _emptySuggestions = ObservableFuture.value(null);
}

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  final TmdbRepository _repository = TmdbRepository();

  String _currentQuery;

  @observable
  SearchMulti searchMulti;

  @observable
  ObservableFuture<SearchMulti> fetchSearchMultiFuture = _emptySearchMulti;

  bool get _isLoaded =>
      fetchSearchMultiFuture != _emptySearchMulti &&
      fetchSearchMultiFuture.status == FutureStatus.fulfilled;

  bool get _isLoading =>
      fetchSearchMultiFuture != _emptySearchMulti &&
      fetchSearchMultiFuture.status == FutureStatus.pending;

  @computed
  bool get hasResults => (_isLoaded || _isLoading) && (searchMulti != null);

  @action
  Future<SearchMulti> _fetchSearchMulti() async {
    searchMulti = null;
    final future = _fetchSearchMultiInternal();
    fetchSearchMultiFuture = ObservableFuture(future);

    return searchMulti = await future;
  }

  @action
  Future<SearchMulti> fetchSearchMultiNextPage() async {
    final future = _fetchSearchMultiInternal();
    fetchSearchMultiFuture = ObservableFuture(future);

    return searchMulti = searchMulti.mergeResults(await future);
  }

  Future<SearchMulti> _fetchSearchMultiInternal() {
    return _repository.api.search
        .multiSearch(
          _currentQuery,
          page: (searchMulti?.page ?? 0) + 1,
          language: TmdbConfig.language.language,
          region: TmdbConfig.region.region,
          includeAdult: TmdbConfig.includeAdult,
        )
        .then((value) => value);
  }

  void queryChanged(String query) {
    _currentQuery = query;
    _fetchSearchMulti();
  }

  static ObservableFuture<SearchMulti> _emptySearchMulti = ObservableFuture.value(null);
}
