import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../components/helpers/tmdb_helper_mixin.dart';
import '../../global/constants.dart';
import '../../material.dart';
import '../../stores/search_store.dart';

class SearchMultiDelegate extends SearchDelegate<String> with TmdbHelperMixin {
  SearchMultiDelegate(this.store) : super();

  final SearchSuggestionsStore store;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          tooltip: 'Clear',
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).whenComplete(() {
      close(context, query.isEmpty ? null : query);
    });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();

    store.fetchSuggestions(query);

    return Observer(
      builder: (_) {
        if (!store.hasSuggestions) {
          return BigLoadingIndicator(
            iconData: Icons.search,
            title: 'Searching',
          );
        }

        return ListView.builder(
          padding: kAppListViewPadding,
          itemCount: store.suggestions.results.length,
          itemBuilder: (ctx, index) {
            return _makeListTile(context, store.suggestions.results[index]);
          },
        );
      },
    );
  }

  Widget _makeListTile(BuildContext context, ResumedMedia resumedMedia) {
    if (resumedMedia is MovieResumed) {
      return _listTile(
        context,
        resumedMedia.title,
        getMediaTypeIcon(resumedMedia.mediaType),
      );
    } else if (resumedMedia is TvResumed) {
      return _listTile(
        context,
        resumedMedia.name,
        getMediaTypeIcon(resumedMedia.mediaType),
      );
    } else if (resumedMedia is PersonResumed) {
      return _listTile(
        context,
        resumedMedia.name,
        getMediaTypeIcon(resumedMedia.mediaType),
      );
    }

    return _listTile(
      context,
      'Unknown media type',
      Icons.play_arrow,
    );
  }

  Widget _listTile(BuildContext context, String title, IconData iconData) {
    return ListTile(
      title: Text(title),
      leading: Icon(iconData),
      onTap: () {
        close(context, title);
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) => context.theme.brightness == Brightness.light
      ? _getThemeLight(context)
      : _getThemeDark(context);

  static ThemeData _getThemeLight(BuildContext context) {
    return context.theme.copyWith(
      primaryColorBrightness: Brightness.light,
      primaryColor: Colors.white,
      primaryIconTheme: context.theme.iconTheme.copyWith(color: Colors.grey[400]),
      textTheme: context.theme.textTheme.apply(
        bodyColor: Colors.black,
        decorationColor: Colors.black,
      ),
      inputDecorationTheme: context.theme.inputDecorationTheme.copyWith(
        hintStyle: context.theme.textTheme.headline6.copyWith(color: Colors.grey[400]),
      ),
    );
  }

  static ThemeData _getThemeDark(BuildContext context) {
    return context.theme.copyWith(
      primaryColorBrightness: Brightness.dark,
      primaryColor: Colors.black,
      primaryIconTheme: context.theme.iconTheme.copyWith(color: Colors.grey[400]),
      textTheme: context.theme.textTheme.apply(
        bodyColor: Colors.blue,
        decorationColor: Colors.blueAccent,
      ),
      inputDecorationTheme: context.theme.inputDecorationTheme.copyWith(
        hintStyle: context.theme.textTheme.headline6.copyWith(color: Colors.grey[600]),
      ),
    );
  }
}
