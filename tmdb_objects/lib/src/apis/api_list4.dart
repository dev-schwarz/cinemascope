part of '../objects.dart';

class ApiList4 {
  ApiList4(this._api);

  final _TmdbObjectsBase _api;

  Future<List4> getList(int id, {int page, String language, List4SortBy sortBy}) async {
    Map json = await _api.list4.getList(
      id,
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return List4.fromJson(json);
  }

  Future<List4Create> create(
    String name,
    String iso_639_1, {
    String description,
    String iso_3166_1,
    bool public,
  }) async {
    Map json = await _api.list4.createList(
      name,
      iso_639_1,
      description: description,
      iso_3166_1: iso_3166_1,
      public: public,
    );
    return List4Create.fromJson(json);
  }

  Future<List4Delete> delete(int id) async {
    Map json = await _api.list4.deleteList(id);
    return List4Delete.fromJson(json);
  }

  Future<List4AddItems> addItems(int id, List<List4ListItem> items) async {
    Map json = await _api.list4.addItems(id, _convertListOfItems(items));
    return List4AddItems.fromJson(json);
  }

  Future<List4RemoveItems> removeItems(int id, List<List4ListItem> items) async {
    Map json = await _api.list4.removeItems(id, _convertListOfItems(items));
    return List4RemoveItems.fromJson(json);
  }

  Future<List4CheckItemStatus> checkItemStatus(int id, int mediaId, TMediaType mediaType) async {
    Map json = await _api.list4.checkItemStatus(id, mediaId, mediaType.toString());
    return List4CheckItemStatus.fromJson(json);
  }

  List<Map<String, dynamic>> _convertListOfItems(List<List4ListItem> items) {
    return List<Map<String, dynamic>>.from(items.map((e) => e.toJson()));
  }
}
