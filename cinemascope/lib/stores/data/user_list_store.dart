part of 'data_store.dart';

class _UserListStore = __UserListStore with _$_UserListStore;

abstract class __UserListStore with Store {
  __UserListStore(this.listId) {
    sortIndex = List4SortBy.originalOrder.index;
    orderIndex = SortOrder.asc.index;
  }

  final TmdbRepository _repository = TmdbRepository();

  final int listId;

  List4 list;

  @observable
  ObservableFuture<List4> fetchListFuture = _emptyList;

  @computed
  bool get hasList =>
      fetchListFuture != _emptyList && fetchListFuture.status == FutureStatus.fulfilled;

  @action
  Future<List4> fetchList() async {
    list = List4();
    final future = _fetchList();
    fetchListFuture = ObservableFuture(future);

    return list = await future;
  }

  @action
  Future<List4> fetchListNextPage() async {
    final future = _fetchList();
    fetchListFuture = ObservableFuture(future);

    return list = await future;
  }

  Future<List4> _fetchList() async {
    return list.mergeResults(
      await _repository.api.list4.getList(
        listId,
        page: (list?.page ?? 0) + 1,
        language: TmdbConfig.language.language,
        sortBy: currentSortBy,
      ),
    );
  }

  @observable
  int sortIndex;

  @action
  void setSortIndex(int value, {bool reloadList = true}) {
    sortIndex = value;
    if (reloadList) {
      fetchList();
    }
  }

  @observable
  int orderIndex;

  @action
  void toggleOrderIndex({bool reloadList = true}) {
    orderIndex = orderIndex == SortOrder.asc.index ? SortOrder.desc.index : SortOrder.asc.index;
    if (reloadList) {
      fetchList();
    }
  }

  @computed
  List4SortBy get currentSortBy {
    List4SortBy sortBy = List4SortBy.values[sortIndex];
    if (orderIndex == SortOrder.asc.index) {
      sortBy.asc;
    } else {
      sortBy.desc;
    }
    return sortBy.copy();
  }

  static ObservableFuture<List4> _emptyList = ObservableFuture.value(null);
}
