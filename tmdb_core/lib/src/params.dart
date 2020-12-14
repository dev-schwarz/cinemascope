part of 'core.dart';

class _Params with MapMixin<String, dynamic> {
  _Params._({this.needsSession = false, this.sessionFragment})
      : assert(!needsSession || sessionFragment is String);

  factory _Params() => _Params._();

  factory _Params.withSession(String sessionFragment) => _Params._(
        needsSession: true,
        sessionFragment: sessionFragment,
      );

  Map<String, dynamic> _map = <String, dynamic>{};

  final bool needsSession;
  final String sessionFragment;

  @override
  operator [](Object key) {
    return _map[key];
  }

  @override
  void operator []=(String key, value) {
    if (value is Iterable) {
      if (value is Iterable<Map>) {
        _map[key] = value;
      } else if (value.length > 0) {
        _map[key] = value.join(',');
      }
    } else {
      _map[key] = value;
    }
  }

  @override
  void clear() {
    _map.clear();
  }

  @override
  Iterable<String> get keys => _map.keys;

  @override
  remove(Object key) {
    dynamic value = _map[key];
    _map.remove(key);
    return value;
  }

  @override
  String toString() {
    final list = <String>[];
    _map.forEach((key, value) {
      if (value != null) {
        list.add('$key=${Uri.encodeQueryComponent(value.toString())}');
      }
    });
    return list.join('&');
  }

  String toJson() {
    final map = Map.from(_map)..removeWhere((key, value) => value == null);
    return jsonEncode(map);
  }
}
