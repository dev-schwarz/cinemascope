part of 'core.dart';

class _QueryMethod {
  const _QueryMethod._(this.index, this._method);

  final int index;
  final String _method;

  static const _QueryMethod GET = const _QueryMethod._(0, 'GET');

  static const _QueryMethod POST = const _QueryMethod._(1, 'POST');

  static const _QueryMethod PUT = const _QueryMethod._(2, 'PUT');

  static const _QueryMethod DELETE = const _QueryMethod._(3, 'DELETE');

  static const _QueryMethod HEAD = const _QueryMethod._(4, 'HEAD');

  @override
  String toString() => this._method;
}
