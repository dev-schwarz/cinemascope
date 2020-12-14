part of '_search.dart';

@JsonSerializable()
class SearchCompanies extends TResultsObject<SearchCompaniesItem> {
  SearchCompanies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<SearchCompaniesItem> results;

  factory SearchCompanies.fromJson(Map<String, dynamic> json) => _$SearchCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCompaniesToJson(this);

  @override
  SearchCompanies mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return SearchCompanies(
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
class SearchCompaniesItem extends Equatable {
  final int id;
  final String name;
  final String logoPath;

  SearchCompaniesItem({
    this.id,
    this.name,
    this.logoPath,
  });

  factory SearchCompaniesItem.fromJson(Map<String, dynamic> json) =>
      _$SearchCompaniesItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCompaniesItemToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        logoPath,
      ];

  @override
  String toString() => _$SearchCompaniesItemToString(this);
}
