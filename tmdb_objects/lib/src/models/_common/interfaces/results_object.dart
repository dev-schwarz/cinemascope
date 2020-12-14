import 'package:equatable/equatable.dart';
import 'package:to_string/to_string.dart';

part 'results_object.g.dart';

@ToString()
abstract class TResultsObject<T> extends Equatable {
  TResultsObject(
    this.page,
    this.totalPages,
    this.totalResults,
  );

  final int page;
  final int totalPages;
  final int totalResults;

  @ToString()
  List<T> get results;

  bool get hasNextPage => page < totalPages;

  TResultsObject mergeResults(TResultsObject other);

  bool checkType(TResultsObject other) => other != null && other.runtimeType == runtimeType;

  @override
  List<Object> get props => [page, totalPages, totalResults, results];

  @override
  String toString() => _$TResultsObjectToString(this);
}
