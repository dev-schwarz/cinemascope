part of 'results_store.dart';

class TrendingStore = _TrendingStore with _$TrendingStore;

abstract class _TrendingStore extends ResultsStore<Trending> with Store {
  @override
  Future<Trending> _fetch() {
    return _repository.api.trending
        .getTrending(
          TTrendingMediaType.all,
          TTrendingTimeWindow.week,
          language: TmdbConfig.language.language,
        )
        .then((value) => value);
  }

  @override
  Future<Trending> _fetchNextPage() {
    return _repository.api.trending
        .getTrending(
          TTrendingMediaType.all,
          TTrendingTimeWindow.week,
          page: (results.page ?? 0) + 1,
          language: TmdbConfig.language.language,
        )
        .then(
          (value) => results.mergeResults(value),
        );
  }
}
