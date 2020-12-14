part of '_account4.dart';

@JsonSerializable()
class Account4Lists extends TResultsObject<Account4ListsItem> {
  Account4Lists({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<Account4ListsItem> results;

  factory Account4Lists.fromJson(Map<String, dynamic> json) => _$Account4ListsFromJson(json);

  Map<String, dynamic> toJson() => _$Account4ListsToJson(this);

  @override
  Account4Lists mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return Account4Lists(
      page: other.page,
      totalPages: other.totalPages,
      totalResults: other.totalResults,
      results: [
        if (results != null) ...results,
        ...other.results,
      ],
    );
  }
}

@ToString()
@JsonSerializable()
class Account4ListsItem extends Equatable {
  final int id;
  final String name;
  final int numberOfItems;
  final int public;
  final String description;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime createdAt;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime updatedAt;
  final String iso_639_1;
  final String iso_3166_1;
  final int sortBy;
  final int adult;
  final int runtime;
  final String revenue;
  final int featured;
  final double averageRating;
  final String posterPath;
  final String backdropPath;

  Account4ListsItem({
    this.id,
    this.name,
    this.numberOfItems,
    this.public,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.iso_639_1,
    this.iso_3166_1,
    this.sortBy,
    this.adult,
    this.runtime,
    this.revenue,
    this.featured,
    this.averageRating,
    this.posterPath,
    this.backdropPath,
  });

  factory Account4ListsItem.fromJson(Map<String, dynamic> json) =>
      _$Account4ListsItemFromJson(json);

  Map<String, dynamic> toJson() => _$Account4ListsItemToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        numberOfItems,
        public,
        description,
        createdAt,
        updatedAt,
        iso_639_1,
        iso_3166_1,
        sortBy,
        adult,
        runtime,
        revenue,
        featured,
        averageRating,
        posterPath,
        backdropPath,
      ];

  @override
  String toString() => _$Account4ListsItemToString(this);
}
