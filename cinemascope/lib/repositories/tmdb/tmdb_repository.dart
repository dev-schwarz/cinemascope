import 'package:tmdb_objects/tmdb_objects.dart';

part 'models/discover_movies_filters.dart';
part 'models/tmdb_config.dart';
part 'models/tmdb_resumed_media.dart';
part 'services/account_service.dart';

class TmdbRepository {
  TmdbRepository.init(TmdbObjects api)
      : assert(api != null),
        _api = api {
    _repository = this;
  }

  factory TmdbRepository() {
    if (_repository == null) {
      throw Exception('TmdbRepository must be initialized first.');
    }
    return _repository;
  }

  static TmdbRepository _repository;

  TmdbObjects get api => _api;
  final TmdbObjects _api;
}
