import 'package:mobx/mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../repositories/tmdb/tmdb_repository.dart';

part 'data_store.g.dart';
part 'favorites_store.dart';
part 'lists_store.dart';
part 'user_list_store.dart';
part 'watch_lists_store.dart';

class DataStore = _DataStore with _$DataStore;

abstract class _DataStore with Store {
  final _FavoritesStore favoritesStore = _FavoritesStore();

  final _WatchListsStore watchListsStore = _WatchListsStore();

  final _ListsStore listsStore = _ListsStore();

  _UserListStore userListStore;

  @action
  void activateUserListStore(int listId) {
    userListStore = _UserListStore(listId);
  }

  @action
  void deactivateUserListStore() {
    userListStore = null;
  }

  @computed
  bool get userListStoreActive => userListStore != null;

  @observable
  bool isFetchingData = false;

  @observable
  bool isInitialized = false;

  @action
  Future<void> fetchAllData() async {
    isFetchingData = true;
    await favoritesStore.fetchFavoriteMovies();
    await favoritesStore.fetchFavoriteTvs();
    await watchListsStore.fetchWatchListMovies();
    await watchListsStore.fetchWatchListTvs();
    await listsStore.fetchUserLists();
    await listsStore.fetchAllListsDetails();

    isFetchingData = false;
    if (!isInitialized) {
      isInitialized = true;
    }
  }
}
