part of '../objects.dart';

class ApiPeople {
  ApiPeople(this._api);

  final _TmdbObjectsBase _api;

  /// Get the primary person details by id.
  Future<Person> getDetails(int id, {String language}) async {
    Map json = await _api.people.getDetails(
      id,
      language: language,
      append: ['credits', 'images'],
    );
    return Person.fromJson(json);
  }
}
