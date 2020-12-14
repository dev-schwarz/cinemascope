abstract class SortBy {
  SortBy(this._index, List<String> values)
      : _sortValues = values.asMap(),
        order = SortOrder.asc;

  final Map<int, String> _sortValues;

  int get index => _index;
  int _index;

  SortOrder order;

  SortBy copy();

  SortBy setPrefix(SortBy other) {
    if (other != null && other.runtimeType == runtimeType) _index = other._index;
    return this;
  }

  SortBy get asc => this..order = SortOrder.asc;

  SortBy get desc => this..order = SortOrder.desc;

  String get prefixString => _sortValues[_index] == null ? null : _sortValues[_index];

  String get orderString => _orderValues[order.index];

  @override
  String toString() => _sortValues[_index] == null ? null : '$prefixString.$orderString';

  @override
  bool operator ==(Object other) {
    return (other != null && other is SortBy && other.runtimeType == runtimeType)
        ? other._index == _index && other.order.index == order.index
        : false;
  }

  @override
  int get hashCode => _index.hashCode + order.index.hashCode;

  static const Map<int, String> _orderValues = <int, String>{0: 'asc', 1: 'desc'};
}

enum SortOrder { asc, desc }
