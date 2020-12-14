part of 'media_store.dart';

abstract class MediaItemAction {
  const MediaItemAction();
}

class MediaItemActionFavorite extends MediaItemAction {
  const MediaItemActionFavorite(this.favorite);

  final bool favorite;
}

class MediaItemActionWatchList extends MediaItemAction {
  const MediaItemActionWatchList(this.watchList);

  final bool watchList;
}

class MediaItemActionRate extends MediaItemAction {
  const MediaItemActionRate(this.rated, this.value);

  final bool rated;
  final double value;
}

class MediaItemActionLists extends MediaItemAction {
  const MediaItemActionLists(this.listsAdded, this.listsRemoved);

  final int listsAdded;
  final int listsRemoved;
}
