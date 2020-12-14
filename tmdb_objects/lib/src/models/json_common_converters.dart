import 'package:json_annotation/json_annotation.dart';

import '_common/_common.dart';
import '_common/objects/_common_objects.dart';
import 'movie/_movie.dart';
import 'people/_people.dart';
import 'tv/_tv.dart';

class ResumedMediaConverter<T extends ResumedMedia> implements JsonConverter<T, Object> {
  const ResumedMediaConverter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      TMediaType mediaType;
      if (json.containsKey('media_type')) {
        final sMediaType = json['media_type'] as String;
        if (sMediaType == 'movie') {
          mediaType = TMediaType.movie;
        } else if (sMediaType == 'tv') {
          mediaType = TMediaType.tv;
        } else if (sMediaType == 'person') {
          mediaType = TMediaType.person;
        }
      } else {
        if (json.containsKey('title')) {
          mediaType = TMediaType.movie;
        } else if (json.containsKey('first_air_date')) {
          mediaType = TMediaType.tv;
        } else if (json.containsKey('gender')) {
          mediaType = TMediaType.person;
        }
      }

      if (mediaType == TMediaType.movie) {
        return MovieResumed.fromJson(json) as T;
      } else if (mediaType == TMediaType.tv) {
        return TvResumed.fromJson(json) as T;
      } else if (mediaType == TMediaType.person) {
        return PersonResumed.fromJson(json) as T;
      }
    }

    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
