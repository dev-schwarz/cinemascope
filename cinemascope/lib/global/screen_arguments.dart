import 'package:flutter/foundation.dart' show required;
import 'package:tmdb_objects/tmdb_objects.dart';

import '../stores/media/media_store.dart';
import '../stores/results/results_store.dart';

// import '../repositories/tmdb/tmdb_repository.dart';
// import '../stores/media/media_store.dart';

class HomeTrendingScreenArguments {
  const HomeTrendingScreenArguments({
    @required this.trendingStore,
  });

  final TrendingStore trendingStore;
}

class UserListScreenArguments {
  const UserListScreenArguments({
    @required this.list,
  });

  final Account4ListsItem list;
}

class MovieScreenArguments {
  const MovieScreenArguments({
    @required this.movieStore,
  });

  final MovieStore movieStore;
}

class PersonScreenArguments {
  const PersonScreenArguments({
    @required this.personStore,
  });

  final PersonStore personStore;
}

class TvScreenArguments {
  const TvScreenArguments({
    @required this.tvStore,
  });

  final TvStore tvStore;
}

// class TvSeasonScreenArguments {
//   const TvSeasonScreenArguments({
//     @required this.tvSeasonStore,
//   });

//   final TvSeasonStore tvSeasonStore;
// }

// class TvEpisodeScreenArguments {
//   const TvEpisodeScreenArguments({
//     @required this.tvEpisodeStore,
//   });

//   final TvEpisodeStore tvEpisodeStore;
// }

// class RecommendationsScreenArguments {
//   const RecommendationsScreenArguments({
//     @required this.resumedMedia,
//   });

//   final TmdbResumedMedia resumedMedia;
// }
