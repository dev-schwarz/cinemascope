part of 'core.dart';

void _checkNotNull(dynamic value, String name) {
  if (value == null) {
    throw ArgumentError.notNull(name);
  }
}

bool _responseSuccess(Map resp) => resp != null && resp['success'];

String _makeMessage(String msg, Map resp) {
  String result = msg;
  if (resp != null) {
    if (resp.containsKey('status_code')) {
      result += ' (statusCode: ${resp['status_code']}) ';
    }
    if (resp.containsKey('status_message')) {
      result += ': ${resp['status_message']}';
    }
  }
  return result;
}

enum _AccessTokenType { read, user }
