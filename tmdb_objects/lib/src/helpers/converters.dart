DateTime dateTimeFromString(String v) {
  return DateTime.tryParse(v ?? '');
}

String dateTimeToString(DateTime v) {
  return v == null
      ? ''
      : '${_padZeros(v.year, 2)}'
          '${_padZeros(v.month)}'
          '${_padZeros(v.day)}';
}

String _padZeros(num v, [int size = 2]) {
  return v == null ? '' : v.toString().padLeft(size, '0');
}
