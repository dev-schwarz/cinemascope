part of '_list4.dart';

@ToString()
@JsonSerializable()
class List4<T extends ResumedMedia> extends TResultsObject<T> {
  final int id;
  final String name;
  final String description;
  final String iso_639_1;
  final String iso_3166_1;
  final bool public;
  final int revenue;
  final int runtime;
  final String posterPath;
  final String backdropPath;
  final double averageRating;
  final List4CreatedBy createdBy;
  @ResumedMediaConverter()
  final List<T> results;

  List4({
    int page,
    int totalPages,
    int totalResults,
    this.id,
    this.name,
    this.description,
    this.iso_639_1,
    this.iso_3166_1,
    this.public,
    this.revenue,
    this.runtime,
    this.posterPath,
    this.backdropPath,
    this.averageRating,
    this.createdBy,
    this.results,
  }) : super(page, totalPages, totalResults);

  factory List4.fromJson(Map<String, dynamic> json) => _$List4FromJson<T>(json);

  Map<String, dynamic> toJson() => _$List4ToJson(this);

  @override
  List4 mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    final o = other as List4;

    return List4(
      page: o.page,
      totalPages: o.totalPages,
      totalResults: o.totalResults,
      id: o.id,
      name: o.name,
      description: o.description,
      iso_639_1: o.iso_639_1,
      iso_3166_1: o.iso_3166_1,
      public: o.public,
      revenue: o.revenue,
      runtime: o.runtime,
      posterPath: o.posterPath,
      backdropPath: o.backdropPath,
      averageRating: o.averageRating,
      createdBy: o.createdBy,
      results: [
        if (results != null) ...results,
        ...o.results,
      ],
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        description,
        iso_639_1,
        iso_3166_1,
        public,
        revenue,
        runtime,
        posterPath,
        backdropPath,
        averageRating,
        createdBy,
        page,
        totalPages,
        totalResults,
        results,
      ];

  @override
  String toString() => _$List4ToString(this);
}

@ToString()
@JsonSerializable()
class List4CreatedBy extends Equatable {
  final String name;
  final String username;
  final String gravatarHash;

  List4CreatedBy({this.name, this.username, this.gravatarHash});

  factory List4CreatedBy.fromJson(Map<String, dynamic> json) => _$List4CreatedByFromJson(json);

  Map<String, dynamic> toJson() => _$List4CreatedByToJson(this);

  @override
  List<Object> get props => [name, username, gravatarHash];

  @override
  String toString() => _$List4CreatedByToString(this);
}
