import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../../components/helpers/tmdb_helper_mixin.dart';
import '../../../global/constants.dart';
import '../../../material.dart';
import '../../../repositories/tmdb/tmdb_repository.dart';

class LibraryListsSection extends StatelessWidget {
  const LibraryListsSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listsStore = context.dataStore.listsStore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'My Lists',
            style: context.theme.textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: 10.0),
        Observer(
          builder: (_) {
            if (!listsStore.hasUserLists) {
              return const CircularProgressIndicator();
            }

            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: kAppListViewPadding,
              itemCount: listsStore.userLists.totalResults,
              itemBuilder: (ctx, index) {
                return _ListTile(list: listsStore.userLists.results[index]);
              },
            );
          },
        ),
      ],
    );
  }
}

class _ListTile extends StatelessWidget with TmdbHelperMixin {
  const _ListTile({
    Key key,
    @required this.list,
  })  : assert(list != null),
        super(key: key);

  final Account4ListsItem list;

  @override
  Widget build(BuildContext context) {
    final leftColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          list.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.appTheme.mediaTileTheme.titleTextStyle,
        ),
        const SizedBox(height: 8.0),
        Text(
          'Created at: ${formatDate(list.createdAt)}\n'
          'Updated at: ${formatDate(list.updatedAt)}',
          style: context.appTheme.mediaTileTheme.descriptionTextStyle,
        ),
      ],
    );

    return Container(
      height: 80.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.LIBRARY_USER_LIST,
            arguments: UserListScreenArguments(list: list),
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 6.0, 4.0, 6.0),
          child: Row(
            children: [
              Expanded(child: leftColumn),
              const SizedBox(width: 18.0),
              _ListPoster(
                imageUrl: TmdbConfig.makeBackdropUrl(list.backdropPath),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ListPoster extends StatelessWidget {
  const _ListPoster({
    Key key,
    this.imageUrl,
    this.alternativeIcon = Icons.view_list,
  }) : super(key: key);

  final String imageUrl;
  final IconData alternativeIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: AspectRatio(
        aspectRatio: kAppTmdbBackdropAspectRatio,
        child: Container(
          decoration: BoxDecoration(
            color: context.appTheme.mediaTileTheme.posterBackgroundColor,
            image: imageUrl != null
                ? DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: imageUrl == null
              ? Icon(
                  alternativeIcon,
                  size: kAppAlternativeMediaIconSize,
                )
              : null,
        ),
      ),
    );
  }
}
