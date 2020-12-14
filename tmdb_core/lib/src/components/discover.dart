part of '../core.dart';

class CoreDiscover {
  static const _startPoint = 'discover';

  CoreDiscover(this._core);

  final TmdbCore _core;

  /// Discover movies by different types of data like average rating, number of votes,
  /// genres and certifications. You can get a valid list of certifications from the
  /// certifications list method.
  ///
  /// Discover also supports a nice list of sort options. See below for all of the
  /// available options.
  ///
  /// Please note, when using certification \ certification.lte you must also specify
  /// certification_country. These two parameters work together in order to filter
  /// the results. You can only filter results with the countries we have added to our
  /// certifications list.
  ///
  /// If you specify the region parameter, the regional release date will be used
  /// instead of the primary release date. The date returned will be the first date
  /// based on your query (ie. if a with_release_type is specified). It's important
  /// to note the order of the release types that are used. Specifying "2|3" would
  /// return the limited theatrical release date as opposed to "3|2" which would
  /// return the theatrical date.
  ///
  /// Also note that a number of filters support being comma (,) or pipe (|) separated.
  /// Comma's are treated like an AND and query while pipe's are an OR.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - popularity.asc
  /// - popularity.desc
  /// - release_date.asc
  /// - release_date.desc
  /// - revenue.asc
  /// - revenue.desc
  /// - primary_release_date.asc
  /// - primary_release_date.desc
  /// - original_title.asc
  /// - original_title.desc
  /// - vote_average.asc
  /// - vote_average.desc
  /// - vote_count.asc
  /// - vote_count.desc
  Future<Map> movieDiscover({
    int page,
    String language,
    String region,
    String sortBy,
    String certificationCountry,
    String certification,
    String certificationGte,
    String certificationLte,
    bool includeAdult,
    bool includeVideo,
    int primaryReleaseYear,
    String primaryReleaseDateGte,
    String primaryReleaseDateLte,
    String releaseDateGte,
    String releaseDateLte,
    int withReleaseType,
    int year,
    int voteCountGte,
    int voteCountLte,
    num voteAverageGte,
    num voteAverageLte,
    String withCast,
    String withCrew,
    String withPeople,
    String withCompanies,
    String withGenres,
    String withoutGenres,
    String withKeywords,
    String withoutKeywords,
    int withRuntimeGte,
    int withRuntimeLte,
    String withOriginalLanguage,
  }) {
    _Params params = _Params();
    params['page'] = page;
    params['language'] = language;
    params['region'] = region;
    params['sort_by'] = sortBy;
    params['certification_country'] = certificationCountry;
    params['certification'] = certification;
    params['certification.gte'] = certificationGte;
    params['certification.lte'] = certificationLte;
    params['include_adult'] = includeAdult;
    params['include_video'] = includeVideo;
    params['primary_release_year'] = primaryReleaseYear;
    params['primary_release_date.gte'] = primaryReleaseDateGte;
    params['primary_release_date.lte'] = primaryReleaseDateLte;
    params['release_date.gte'] = releaseDateGte;
    params['release_date.lte'] = releaseDateLte;
    params['with_release_type'] = withReleaseType;
    params['year'] = year;
    params['vote_count.gte'] = voteCountGte;
    params['vote_count.lte'] = voteCountLte;
    params['vote_average.gte'] = voteAverageGte;
    params['vote_average.lte'] = voteAverageLte;
    params['with_cast'] = withCast;
    params['with_crew'] = withCrew;
    params['with_people'] = withPeople;
    params['with_companies'] = withCompanies;
    params['with_genres'] = withGenres;
    params['without_genres'] = withoutGenres;
    params['with_keywords'] = withKeywords;
    params['without_keywords'] = withoutKeywords;
    params['with_runtime.gte'] = withRuntimeGte;
    params['with_runtime.lte'] = withRuntimeLte;
    params['with_original_language'] = withOriginalLanguage;
    return _core._query3('$_startPoint/movie', params: params);
  }

  /// Discover TV shows by different types of data like average rating, number of votes,
  /// genres, the network they aired on and air dates.
  ///
  /// Discover also supports a nice list of sort options. See below for all of the
  /// available options.
  ///
  /// Also note that a number of filters support being comma (,) or pipe (|) separated.
  /// Comma's are treated like an AND and query while pipe's are an OR.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - vote_average.asc
  /// - vote_average.desc
  /// - first_air_date.asc
  /// - first_air_date.desc
  /// - popularity.asc
  /// - popularity.desc
  Future<Map> tvDiscover({
    int page,
    String language,
    String sortBy,
    String airDateGte,
    String airDateLte,
    String firstAirDateGte,
    String firstAirDateLte,
    int firstAirDateYear,
    String timezone,
    int voteCountGte,
    num voteAverageGte,
    String withGenres,
    String withoutGenres,
    String withNetworks,
    int withRuntimeGte,
    int withRuntimeLte,
    bool includeNullFirstAirDates,
    String withOriginalLanguage,
    String withCompanies,
    String withKeywords,
    String withoutKeywords,
    bool screenedTheatrically,
  }) {
    _Params params = _Params();
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    params['air_date.gte'] = airDateGte;
    params['air_date.lte'] = airDateLte;
    params['first_air_date.gte'] = firstAirDateGte;
    params['first_air_date.lte'] = firstAirDateLte;
    params['first_air_date_year'] = firstAirDateYear;
    params['timezone'] = timezone;
    params['vote_count.gte'] = voteCountGte;
    params['vote_average.gte'] = voteAverageGte;
    params['with_genres'] = withGenres;
    params['without_genres'] = withoutGenres;
    params['with_networks'] = withNetworks;
    params['with_runtime.gte'] = withRuntimeGte;
    params['with_runtime.lte'] = withRuntimeLte;
    params['include_null_first_air_dates'] = includeNullFirstAirDates;
    params['with_original_language'] = withOriginalLanguage;
    params['with_companies'] = withCompanies;
    params['with_keywords'] = withKeywords;
    params['without_keywords'] = withoutKeywords;
    params['screened_theatrically'] = screenedTheatrically;
    return _core._query3('$_startPoint/tv', params: params);
  }
}
