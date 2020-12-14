// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultsStore<T extends TResultsObject<dynamic>>
    on _ResultsStore<T>, Store {
  Computed<bool> _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: '_ResultsStore.isEmpty'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ResultsStore.isLoading'))
          .value;
  Computed<bool> _$isLoadingNextPageComputed;

  @override
  bool get isLoadingNextPage => (_$isLoadingNextPageComputed ??= Computed<bool>(
          () => super.isLoadingNextPage,
          name: '_ResultsStore.isLoadingNextPage'))
      .value;
  Computed<bool> _$isLoadedComputed;

  @override
  bool get isLoaded => (_$isLoadedComputed ??=
          Computed<bool>(() => super.isLoaded, name: '_ResultsStore.isLoaded'))
      .value;

  final _$stateAtom = Atom(name: '_ResultsStore.state');

  @override
  FetchState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(FetchState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$resultsAtom = Atom(name: '_ResultsStore.results');

  @override
  T get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(T value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$_ResultsStoreActionController =
      ActionController(name: '_ResultsStore');

  @override
  void _setResults(T value) {
    final _$actionInfo = _$_ResultsStoreActionController.startAction(
        name: '_ResultsStore._setResults');
    try {
      return super._setResults(value);
    } finally {
      _$_ResultsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
results: ${results},
isEmpty: ${isEmpty},
isLoading: ${isLoading},
isLoadingNextPage: ${isLoadingNextPage},
isLoaded: ${isLoaded}
    ''';
  }
}

mixin _$DiscoverMoviesStore on _DiscoverMoviesStore, Store {
  final _$filtersAtom = Atom(name: '_DiscoverMoviesStore.filters');

  @override
  DiscoverMovieFilters get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(DiscoverMovieFilters value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  final _$viewStoreAtom = Atom(name: '_DiscoverMoviesStore.viewStore');

  @override
  DiscoverMoviesViewStore get viewStore {
    _$viewStoreAtom.reportRead();
    return super.viewStore;
  }

  @override
  set viewStore(DiscoverMoviesViewStore value) {
    _$viewStoreAtom.reportWrite(value, super.viewStore, () {
      super.viewStore = value;
    });
  }

  final _$filterStoreAtom = Atom(name: '_DiscoverMoviesStore.filterStore');

  @override
  DiscoverMoviesFilterStore get filterStore {
    _$filterStoreAtom.reportRead();
    return super.filterStore;
  }

  @override
  set filterStore(DiscoverMoviesFilterStore value) {
    _$filterStoreAtom.reportWrite(value, super.filterStore, () {
      super.filterStore = value;
    });
  }

  final _$_DiscoverMoviesStoreActionController =
      ActionController(name: '_DiscoverMoviesStore');

  @override
  void setFilters(DiscoverMovieFilters value) {
    final _$actionInfo = _$_DiscoverMoviesStoreActionController.startAction(
        name: '_DiscoverMoviesStore.setFilters');
    try {
      return super.setFilters(value);
    } finally {
      _$_DiscoverMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterStore(DiscoverMoviesFilterStore value) {
    final _$actionInfo = _$_DiscoverMoviesStoreActionController.startAction(
        name: '_DiscoverMoviesStore.setFilterStore');
    try {
      return super.setFilterStore(value);
    } finally {
      _$_DiscoverMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filters: ${filters},
viewStore: ${viewStore},
filterStore: ${filterStore}
    ''';
  }
}

mixin _$DiscoverMoviesViewStore on _DiscoverMoviesViewStore, Store {
  Computed<bool> _$isAnimatingComputed;

  @override
  bool get isAnimating =>
      (_$isAnimatingComputed ??= Computed<bool>(() => super.isAnimating,
              name: '_DiscoverMoviesViewStore.isAnimating'))
          .value;

  final _$setupVisibleAtom =
      Atom(name: '_DiscoverMoviesViewStore.setupVisible');

  @override
  bool get setupVisible {
    _$setupVisibleAtom.reportRead();
    return super.setupVisible;
  }

  @override
  set setupVisible(bool value) {
    _$setupVisibleAtom.reportWrite(value, super.setupVisible, () {
      super.setupVisible = value;
    });
  }

  final _$opacityAtom = Atom(name: '_DiscoverMoviesViewStore.opacity');

  @override
  double get opacity {
    _$opacityAtom.reportRead();
    return super.opacity;
  }

  @override
  set opacity(double value) {
    _$opacityAtom.reportWrite(value, super.opacity, () {
      super.opacity = value;
    });
  }

  final _$closeButtonOpacityAtom =
      Atom(name: '_DiscoverMoviesViewStore.closeButtonOpacity');

  @override
  double get closeButtonOpacity {
    _$closeButtonOpacityAtom.reportRead();
    return super.closeButtonOpacity;
  }

  @override
  set closeButtonOpacity(double value) {
    _$closeButtonOpacityAtom.reportWrite(value, super.closeButtonOpacity, () {
      super.closeButtonOpacity = value;
    });
  }

  final _$actionIconOpacityAtom =
      Atom(name: '_DiscoverMoviesViewStore.actionIconOpacity');

  @override
  double get actionIconOpacity {
    _$actionIconOpacityAtom.reportRead();
    return super.actionIconOpacity;
  }

  @override
  set actionIconOpacity(double value) {
    _$actionIconOpacityAtom.reportWrite(value, super.actionIconOpacity, () {
      super.actionIconOpacity = value;
    });
  }

  final _$actionIconDataAtom =
      Atom(name: '_DiscoverMoviesViewStore.actionIconData');

  @override
  IconData get actionIconData {
    _$actionIconDataAtom.reportRead();
    return super.actionIconData;
  }

  @override
  set actionIconData(IconData value) {
    _$actionIconDataAtom.reportWrite(value, super.actionIconData, () {
      super.actionIconData = value;
    });
  }

  final _$setupDialogOpacityAtom =
      Atom(name: '_DiscoverMoviesViewStore.setupDialogOpacity');

  @override
  double get setupDialogOpacity {
    _$setupDialogOpacityAtom.reportRead();
    return super.setupDialogOpacity;
  }

  @override
  set setupDialogOpacity(double value) {
    _$setupDialogOpacityAtom.reportWrite(value, super.setupDialogOpacity, () {
      super.setupDialogOpacity = value;
    });
  }

  final _$_DiscoverMoviesViewStoreActionController =
      ActionController(name: '_DiscoverMoviesViewStore');

  @override
  void setAnimationValue(double value) {
    final _$actionInfo = _$_DiscoverMoviesViewStoreActionController.startAction(
        name: '_DiscoverMoviesViewStore.setAnimationValue');
    try {
      return super.setAnimationValue(value);
    } finally {
      _$_DiscoverMoviesViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
setupVisible: ${setupVisible},
opacity: ${opacity},
closeButtonOpacity: ${closeButtonOpacity},
actionIconOpacity: ${actionIconOpacity},
actionIconData: ${actionIconData},
setupDialogOpacity: ${setupDialogOpacity},
isAnimating: ${isAnimating}
    ''';
  }
}

mixin _$DiscoverMoviesFilterStore on _DiscoverMoviesFilterStore, Store {
  Computed<bool> _$yearValidComputed;

  @override
  bool get yearValid =>
      (_$yearValidComputed ??= Computed<bool>(() => super.yearValid,
              name: '_DiscoverMoviesFilterStore.yearValid'))
          .value;

  final _$sortIndexAtom = Atom(name: '_DiscoverMoviesFilterStore.sortIndex');

  @override
  int get sortIndex {
    _$sortIndexAtom.reportRead();
    return super.sortIndex;
  }

  @override
  set sortIndex(int value) {
    _$sortIndexAtom.reportWrite(value, super.sortIndex, () {
      super.sortIndex = value;
    });
  }

  final _$sortOrderIndexAtom =
      Atom(name: '_DiscoverMoviesFilterStore.sortOrderIndex');

  @override
  int get sortOrderIndex {
    _$sortOrderIndexAtom.reportRead();
    return super.sortOrderIndex;
  }

  @override
  set sortOrderIndex(int value) {
    _$sortOrderIndexAtom.reportWrite(value, super.sortOrderIndex, () {
      super.sortOrderIndex = value;
    });
  }

  final _$yearAtom = Atom(name: '_DiscoverMoviesFilterStore.year');

  @override
  String get year {
    _$yearAtom.reportRead();
    return super.year;
  }

  @override
  set year(String value) {
    _$yearAtom.reportWrite(value, super.year, () {
      super.year = value;
    });
  }

  final _$_DiscoverMoviesFilterStoreActionController =
      ActionController(name: '_DiscoverMoviesFilterStore');

  @override
  void setSortIndex(int value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreActionController
        .startAction(name: '_DiscoverMoviesFilterStore.setSortIndex');
    try {
      return super.setSortIndex(value);
    } finally {
      _$_DiscoverMoviesFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortOrderIndex(int value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreActionController
        .startAction(name: '_DiscoverMoviesFilterStore.setSortOrderIndex');
    try {
      return super.setSortOrderIndex(value);
    } finally {
      _$_DiscoverMoviesFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYear(String value) {
    final _$actionInfo = _$_DiscoverMoviesFilterStoreActionController
        .startAction(name: '_DiscoverMoviesFilterStore.setYear');
    try {
      return super.setYear(value);
    } finally {
      _$_DiscoverMoviesFilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sortIndex: ${sortIndex},
sortOrderIndex: ${sortOrderIndex},
year: ${year},
yearValid: ${yearValid}
    ''';
  }
}

mixin _$TrendingStore on _TrendingStore, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}
