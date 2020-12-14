import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:to_string/to_string.dart';

part 'generic_results.g.dart';

@ToString()
@JsonSerializable()
class TGenericResults<T> extends Equatable {
  final int id;
  final int totalPages;
  final int totalResults;
  @_Converter()
  final List<T> results;

  TGenericResults(this.id, this.totalPages, this.totalResults, this.results);

  factory TGenericResults.fromJson(Map json) => _$TGenericResultsFromJson<T>(json);

  Map toJson() => _$TGenericResultsToJson(this);

  @override
  List<Object> get props => [id, totalPages, totalResults, results];

  @override
  String toString() => _$TGenericResultsToString(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    // if (json is Map<String, dynamic>) {
    //   if (T is ResumedMedia) {
    //     final mediaType = json['media_type'] as String;
    //     if (mediaType == 'movie') {
    //       return MovieResumed.fromJson(json) as T;
    //     }
    //   }
    // }

    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
