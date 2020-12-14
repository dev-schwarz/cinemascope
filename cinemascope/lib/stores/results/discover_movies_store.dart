part of 'results_store.dart';

class DiscoverMoviesStore = _DiscoverMoviesStore with _$DiscoverMoviesStore;

abstract class _DiscoverMoviesStore extends ResultsStore<DiscoverMovie> with Store {
  _DiscoverMoviesStore({double initialAnimationValue = 0.0}) : super(autoFetch: false) {
    filters = DiscoverMovieFilters();
    filterStore = DiscoverMoviesFilterStore.init(filters);
    viewStore = DiscoverMoviesViewStore(initialAnimationValue);
  }

  @observable
  DiscoverMovieFilters filters;

  @action
  void setFilters(DiscoverMovieFilters value) => filters = value;

  @observable
  DiscoverMoviesViewStore viewStore;

  @action
  void setFilterStore(DiscoverMoviesFilterStore value) => filterStore = value;

  void resetFilterStore() => filterStore.setValues(filters);

  void applyStoreFilter() {
    setFilters(filters.copyWith(
      sortIndex: filterStore.sortIndex,
      sortOrderIndex: filterStore.sortOrderIndex,
      year: filterStore.year == null ? null : int.tryParse(filterStore.year),
    ));
  }

  @observable
  DiscoverMoviesFilterStore filterStore;

  List<ReactionDisposer> _disposers;

  void setupReactions() {
    _disposers = [
      reaction((_) => filters, (_) => fetchResults()),
    ];
  }

  void dispose() {
    _disposers.forEach((d) => d());
  }

  @override
  Future<DiscoverMovie> _fetch() {
    return _performFetch().then((value) => value);
  }

  @override
  Future<DiscoverMovie> _fetchNextPage() {
    return _performFetch(
      page: (results.page ?? 0) + 1,
    ).then((value) => results.mergeResults(value));
  }

  Future<DiscoverMovie> _performFetch({int page = 1}) async {
    DiscoverMovieSortBy sortBy = DiscoverMovieSortBy.values[filters.sortIndex]
      ..order = SortOrder.values[filters.sortOrderIndex];

    return await _repository.api.discover.movieDiscover(
      page: page,
      language: TmdbConfig.language.language,
      sortBy: sortBy,
      primaryReleaseYear: filters.primaryReleaseYear,
      year: filters.year,
      releaseDateGte: filters.releaseDateGte,
      releaseDateLte: filters.releaseDateLte,
      voteCountGte: filters.voteCountGte,
      voteCountLte: filters.voteCountLte,
      voteAverageGte: filters.voteAverageGte,
      voteAverageLte: filters.voteAverageLte,
    );
  }
}

class DiscoverMoviesViewStore = _DiscoverMoviesViewStore with _$DiscoverMoviesViewStore;

abstract class _DiscoverMoviesViewStore with Store {
  _DiscoverMoviesViewStore(double animationValue) {
    setAnimationValue(animationValue);
  }

  @observable
  bool setupVisible;

  @observable
  double opacity;

  @observable
  double closeButtonOpacity;

  @observable
  double actionIconOpacity;

  @observable
  IconData actionIconData;

  @observable
  double setupDialogOpacity;

  @computed
  bool get isAnimating => opacity != 0.0 && opacity != 1.0;

  @action
  void setAnimationValue(double value) {
    opacity = value;
    // setup is considered visible when passed the half of the animation
    setupVisible = value >= 0.5;
    // opacity value of the setup dialog background is 90%
    setupDialogOpacity = value * 0.9;
    if (setupVisible) {
      actionIconData = Icons.check;
      closeButtonOpacity = actionIconOpacity = (value - 0.5) * 2.0;
    } else {
      actionIconData = Icons.sort;
      actionIconOpacity = ((value - 1.0) * 2.0).abs() - 1.0;
      closeButtonOpacity = 0.0;
    }
  }
}

class DiscoverMoviesFilterStore extends _DiscoverMoviesFilterStore
    with _$DiscoverMoviesFilterStore {
  DiscoverMoviesFilterStore._();

  factory DiscoverMoviesFilterStore.init(DiscoverMovieFilters filters) {
    return DiscoverMoviesFilterStore._()..setValues(filters);
  }
}

abstract class _DiscoverMoviesFilterStore with Store {
  void setValues(DiscoverMovieFilters filters) {
    sortIndex = filters.sortIndex;
    sortOrderIndex = filters.sortOrderIndex;
    year =
        filters.year != null && filters.year.toString().isNotEmpty ? filters.year.toString() : null;
  }

  @observable
  int sortIndex;

  @action
  void setSortIndex(int value) => sortIndex = value;

  @observable
  int sortOrderIndex;

  @action
  void setSortOrderIndex(int value) => sortOrderIndex = value;

  @observable
  String year;

  @action
  void setYear(String value) => year = value;

  @computed
  bool get yearValid => year != null && RegExpUtils.isYear(year);

  String get yearError => year == null || yearValid ? null : 'Invalid year';
}
