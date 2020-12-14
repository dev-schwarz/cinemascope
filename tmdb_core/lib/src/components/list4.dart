part of '../core.dart';

class CoreList4 {
  static const _startPoint = 'list';

  CoreList4(this._core);

  final TmdbCore _core;

  /// This method will retrieve a list by id.
  ///
  /// Private lists can only be accessed by their owners and therefore
  /// require a valid user access token.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - original_order.asc
  /// - original_order.desc
  /// - release_date.asc
  /// - release_date.desc
  /// - title.asc
  /// - title.desc
  /// - vote_average.asc
  /// - vote_average.desc
  Future<Map> getList(int id, {int page, String language, String sortBy}) {
    _checkNotNull(id, 'id');
    _Params params = _Params.withSession('$_startPoint');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query4('$id', params: params);
  }

  /// This method will create a new list.
  ///
  /// You will need to have valid user access token in order to create
  /// a new list.
  ///
  /// ----
  /// [iso\_639\_1] and [iso3\_166\_1] are the variants for your list.
  /// Default value for [iso\_639\_1] is 'en', and for [iso\_3166\_1] is 'US'.
  Future<Map> createList(String name, String iso_639_1,
      {String description, bool public, String iso_3166_1}) {
    _checkNotNull(name, 'name');
    _checkNotNull(iso_639_1, 'iso_639_1');
    _Params params = _Params.withSession('$_startPoint');
    params['name'] = name;
    params['iso_639_1'] = iso_639_1;
    params['description'] = description;
    params['public'] = public;
    params['iso_3166_1'] = iso_3166_1;
    return _core._query4(
      '',
      method: _QueryMethod.POST,
      params: params,
    );
  }

  /// This method will let you update the details of a list.
  ///
  /// You must be the owner of the list and therefore have a valid user
  /// access token in order to edit it.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - original_order.asc
  /// - original_order.desc
  /// - vote_average.asc
  /// - vote_average.desc
  /// - primary_release_date.asc
  /// - primary_release_date.desc
  /// - title.asc
  /// - title.desc
  Future<Map> updateList(int id, {String name, String description, bool public, String sortBy}) {
    _checkNotNull(id, 'id');
    _Params params = _Params.withSession('$_startPoint/$id');
    params['name'] = name;
    params['description'] = description;
    params['public'] = public;
    params['sort_by'] = sortBy;
    return _core._query4(
      '',
      method: _QueryMethod.PUT,
      params: params,
    );
  }

  /// This method lets you clear all of the items from a list in a single
  /// request.
  ///
  /// **This action cannot be reversed so use it with caution.**
  ///
  /// You must be the owner of the list and therefore have a valid user
  /// access token in order to clear a list.
  Future<Map> clearList(int id) {
    _checkNotNull(id, 'id');
    _Params params = _Params.withSession('$_startPoint');
    return _core._query4('$id/clear', params: params);
  }

  /// This method will delete a list by id.
  ///
  /// **This action is not reversible so take care when issuing it.**
  ///
  /// You must be the owner of the list and therefore have a valid user
  /// access token in order to delete it.
  Future<Map> deleteList(int id) {
    _checkNotNull(id, 'id');
    _Params params = _Params.withSession('$_startPoint');
    return _core._query4(
      '$id',
      method: _QueryMethod.DELETE,
      params: params,
    );
  }

  /// This method will let you add items to a list. We support essentially
  /// an unlimited number of items to be posted at a time.
  /// Both movie and TV series are support.
  ///
  /// The results of this query will return a results array.
  /// Each result includes a success field.
  /// If a result is false this will usually indicate that the item already
  /// exists on the list. It may also indicate that the item could not be found.
  ///
  /// You must be the owner of the list and therefore have a valid user
  /// access token in order to add items to a list.
  ///
  /// ----
  /// The parameter [items] must be a [List] of [Map]s,
  /// and each [Map] **must contain these keys:**
  /// - media_type: [String]
  /// - media_id: [int]
  ///
  /// where 'media_type' allowed values are:
  /// - movie
  /// - tv
  Future<Map> addItems(int id, List<Map> items) {
    _checkNotNull(id, 'id');
    _checkNotNull(items, 'items');
    _Params params = _Params.withSession('$_startPoint');
    params['items'] = items;
    return _core._query4(
      '$id/items',
      method: _QueryMethod.POST,
      params: params,
    );
  }

  /// This method will let you update an individual item on a list.
  ///
  /// ***Currently, only adding a comment is supported.***
  ///
  /// You must be the owner of the list and therefore have a valid user
  /// access token in order to edit items.
  ///
  /// ----
  /// The parameter [items] must be a [List] of [Map]s,
  /// and each [Map] **must contain these keys:**
  /// - media_type: [String]
  /// - media_id: [int]
  /// - comment: [String]
  ///
  /// where 'media_type' allowed values are:
  /// - movie
  /// - tv
  Future<Map> updateItems(int id, List<Map> items) {
    _checkNotNull(id, 'id');
    _checkNotNull(items, 'items');
    _Params params = _Params.withSession('$_startPoint');
    params['items'] = items;
    return _core._query4(
      '$id/items',
      method: _QueryMethod.PUT,
      params: params,
    );
  }

  /// This method will let you remove items from a list.
  ///
  /// You can remove multiple items at a time.
  ///
  /// You must be the owner of the list and therefore have a valid user
  /// access token in order to delete items from it.
  ///
  /// ----
  /// The parameter [items] must be a [List] of [Map]s,
  /// and each [Map] **must contain these keys:**
  /// - media_type: [String]
  /// - media_id: [int]
  ///
  /// where 'media_type' allowed values are:
  /// - movie
  /// - tv
  Future<Map> removeItems(int id, List<Map> items) {
    _checkNotNull(id, 'id');
    _checkNotNull(items, 'items');
    _Params params = _Params.withSession('$_startPoint');
    params['items'] = items;
    return _core._query4(
      '$id/items',
      method: _QueryMethod.DELETE,
      params: params,
    );
  }

  /// This method lets you quickly check if the item is already added
  /// to the list.
  ///
  /// You must be the owner of the list and therefore have a valid user
  /// access token in order to check an item status.
  ///
  /// ----
  /// ***[mediaType] allowed values are:***
  /// - movie
  /// - tv
  Future<Map> checkItemStatus(int id, int mediaId, String mediaType) {
    _checkNotNull(id, 'id');
    _checkNotNull(mediaId, 'media_id');
    _checkNotNull(mediaType, 'media_type');
    _Params params = _Params.withSession('$_startPoint');
    params['media_id'] = mediaId;
    params['media_type'] = mediaType;
    return _core._query4('$id/item_status', params: params);
  }
}
