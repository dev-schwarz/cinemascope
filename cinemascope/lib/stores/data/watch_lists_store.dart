part of 'data_store.dart';

class _WatchListsStore = __WatchListsStore with _$_WatchListsStore;

abstract class __WatchListsStore with Store {
  final TmdbRepository _repository = TmdbRepository();

  // --------------------------------------------------------------------------
  // [[ WATCH LIST MOVIES ]]
  // --------------------------------------------------------------------------
  AccountWatchListMovies watchListMovies;

  @observable
  ObservableFuture<AccountWatchListMovies> fetchWatchListMoviesFuture = _emptyWatchListMovies;

  @computed
  bool get hasWatchListMovies =>
      fetchWatchListMoviesFuture != _emptyWatchListMovies &&
      fetchWatchListMoviesFuture.status == FutureStatus.fulfilled;

  @action
  Future<AccountWatchListMovies> fetchWatchListMovies() async {
    watchListMovies = null;
    final future = _fetchWatchListMovies();
    fetchWatchListMoviesFuture = ObservableFuture(future);

    return watchListMovies = await future;
  }

  Future<AccountWatchListMovies> _fetchWatchListMovies() async {
    AccountWatchListMovies resp = AccountWatchListMovies();
    do {
      resp = resp.mergeResults(
        await _repository.api.account.getWatchListMovies(
          page: (resp.page ?? 0) + 1,
          language: TmdbConfig.language.language,
          sortBy: watchListMoviesSortBy,
        ),
      );
    } while (resp.hasNextPage);
    return resp;
  }

  // --------------------------------------------------------------------------
  // [[ WATCH LIST TVS ]]
  // --------------------------------------------------------------------------
  AccountWatchListTvs watchListTvs;

  @observable
  ObservableFuture<AccountWatchListTvs> fetchWatchListTvsFuture = _emptyWatchListTvs;

  @computed
  bool get hasWatchListTvs =>
      fetchWatchListTvsFuture != _emptyWatchListTvs &&
      fetchWatchListTvsFuture.status == FutureStatus.fulfilled;

  @action
  Future<AccountWatchListTvs> fetchWatchListTvs() async {
    watchListTvs = null;
    final future = _fetchWatchListTvs();
    fetchWatchListTvsFuture = ObservableFuture(future);

    return watchListTvs = await future;
  }

  Future<AccountWatchListTvs> _fetchWatchListTvs() async {
    AccountWatchListTvs resp = AccountWatchListTvs();
    do {
      resp = resp.mergeResults(
        await _repository.api.account.getWatchListTvs(
          page: (resp.page ?? 0) + 1,
          language: TmdbConfig.language.language,
          sortBy: watchListTvsSortBy,
        ),
      );
    } while (resp.hasNextPage);
    return resp;
  }

  // --------------------------------------------------------------------------
  // [[ WATCH LIST MOVIES SORT BY ]]
  // --------------------------------------------------------------------------
  @observable
  WatchListMoviesSortBy watchListMoviesSortBy = WatchListMoviesSortBy.createdAt.asc;

  @action
  void toggleWatchListMoviesSortBy() {
    watchListMoviesSortBy = watchListMoviesSortBy.order == SortOrder.asc
        ? watchListMoviesSortBy.copy().desc
        : watchListMoviesSortBy.copy().asc;
    fetchWatchListMovies();
  }

  // --------------------------------------------------------------------------
  // [[ WATCH LIST TVS SORT BY ]]
  // --------------------------------------------------------------------------
  @observable
  WatchListTvsSortBy watchListTvsSortBy = WatchListTvsSortBy.createdAt.asc;

  @action
  void toggleWatchListTvsSortBy() {
    watchListTvsSortBy = watchListTvsSortBy.order == SortOrder.asc
        ? watchListTvsSortBy.copy().desc
        : watchListTvsSortBy.copy().asc;
    fetchWatchListTvs();
  }

  static ObservableFuture<AccountWatchListMovies> _emptyWatchListMovies =
      ObservableFuture.value(null);

  static ObservableFuture<AccountWatchListTvs> _emptyWatchListTvs = ObservableFuture.value(null);
}
