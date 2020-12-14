// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchSuggestionsStore on _SearchSuggestionsStore, Store {
  Computed<bool> _$hasSuggestionsComputed;

  @override
  bool get hasSuggestions =>
      (_$hasSuggestionsComputed ??= Computed<bool>(() => super.hasSuggestions,
              name: '_SearchSuggestionsStore.hasSuggestions'))
          .value;

  final _$fetchSuggestionsFutureAtom =
      Atom(name: '_SearchSuggestionsStore.fetchSuggestionsFuture');

  @override
  ObservableFuture<SearchMulti<ResumedMedia>> get fetchSuggestionsFuture {
    _$fetchSuggestionsFutureAtom.reportRead();
    return super.fetchSuggestionsFuture;
  }

  @override
  set fetchSuggestionsFuture(
      ObservableFuture<SearchMulti<ResumedMedia>> value) {
    _$fetchSuggestionsFutureAtom
        .reportWrite(value, super.fetchSuggestionsFuture, () {
      super.fetchSuggestionsFuture = value;
    });
  }

  final _$fetchSuggestionsAsyncAction =
      AsyncAction('_SearchSuggestionsStore.fetchSuggestions');

  @override
  Future<SearchMulti<ResumedMedia>> fetchSuggestions(String query) {
    return _$fetchSuggestionsAsyncAction
        .run(() => super.fetchSuggestions(query));
  }

  @override
  String toString() {
    return '''
fetchSuggestionsFuture: ${fetchSuggestionsFuture},
hasSuggestions: ${hasSuggestions}
    ''';
  }
}

mixin _$SearchStore on _SearchStore, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults,
              name: '_SearchStore.hasResults'))
          .value;

  final _$searchMultiAtom = Atom(name: '_SearchStore.searchMulti');

  @override
  SearchMulti<ResumedMedia> get searchMulti {
    _$searchMultiAtom.reportRead();
    return super.searchMulti;
  }

  @override
  set searchMulti(SearchMulti<ResumedMedia> value) {
    _$searchMultiAtom.reportWrite(value, super.searchMulti, () {
      super.searchMulti = value;
    });
  }

  final _$fetchSearchMultiFutureAtom =
      Atom(name: '_SearchStore.fetchSearchMultiFuture');

  @override
  ObservableFuture<SearchMulti<ResumedMedia>> get fetchSearchMultiFuture {
    _$fetchSearchMultiFutureAtom.reportRead();
    return super.fetchSearchMultiFuture;
  }

  @override
  set fetchSearchMultiFuture(
      ObservableFuture<SearchMulti<ResumedMedia>> value) {
    _$fetchSearchMultiFutureAtom
        .reportWrite(value, super.fetchSearchMultiFuture, () {
      super.fetchSearchMultiFuture = value;
    });
  }

  final _$_fetchSearchMultiAsyncAction =
      AsyncAction('_SearchStore._fetchSearchMulti');

  @override
  Future<SearchMulti<ResumedMedia>> _fetchSearchMulti() {
    return _$_fetchSearchMultiAsyncAction.run(() => super._fetchSearchMulti());
  }

  final _$fetchSearchMultiNextPageAsyncAction =
      AsyncAction('_SearchStore.fetchSearchMultiNextPage');

  @override
  Future<SearchMulti<ResumedMedia>> fetchSearchMultiNextPage() {
    return _$fetchSearchMultiNextPageAsyncAction
        .run(() => super.fetchSearchMultiNextPage());
  }

  @override
  String toString() {
    return '''
searchMulti: ${searchMulti},
fetchSearchMultiFuture: ${fetchSearchMultiFuture},
hasResults: ${hasResults}
    ''';
  }
}
