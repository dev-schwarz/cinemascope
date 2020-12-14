part of '../core.dart';

class CoreCompanies {
  static const _startPoint = 'company';

  CoreCompanies(this._core);

  final TmdbCore _core;

  /// Get a companies details by id.
  Future<Map> getDetails(int id) {
    _checkNotNull(id, 'id');
    return _core._query3('$_startPoint/$id');
  }

  /// Get the alternative names of a company.
  Future<Map> getAlternativeNames(int id) {
    _checkNotNull(id, 'id');
    return _core._query3('$_startPoint/$id/alternative_names');
  }

  /// Get a companies logos by id.
  ///
  /// There are two image formats that are supported for companies, PNG's and
  /// SVG's. You can see which type the original file is by looking at the
  /// file_type field. We prefer SVG's as they are resolution independent and
  /// as such, the width and height are only there to reflect the original
  /// asset that was uploaded. An SVG can be scaled properly beyond those
  /// dimensions if you call them as a PNG.
  Future<Map> getImages(int id) {
    _checkNotNull(id, 'id');
    return _core._query3('$_startPoint/$id/images');
  }
}
