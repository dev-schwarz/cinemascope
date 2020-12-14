import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../material.dart';
import '../../stores/search_store.dart';
import 'search_multi_delegate.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchStore _searchStore = SearchStore();
  String _lastQuery;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).whenComplete(() {
      _openSearchDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Column(
          children: [
            Text('Search'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _openSearchDialog();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                if (!_searchStore.hasResults) {
                  return const BigIconMessage(
                    iconData: Icons.search,
                    message: 'Search',
                  );
                } else {
                  if (_searchStore.searchMulti.totalResults == 0) {
                    return const BigIconMessage(
                      iconData: Icons.sentiment_dissatisfied,
                      message: 'No results found',
                    );
                  } else {
                    return Observer(
                      builder: (_) {
                        return ResultsListView<SearchMulti>(
                          content: _searchStore.searchMulti,
                          loadNextPage: _searchStore.fetchSearchMultiNextPage,
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openSearchDialog() async {
    final query = await showSearch(
      context: context,
      delegate: SearchMultiDelegate(SearchSuggestionsStore()),
      query: _lastQuery,
    );

    if (query != null) {
      _lastQuery = query;
      _searchStore.queryChanged(query);
    } else if (_lastQuery == null) {
      Navigator.of(context).pop();
    }
  }
}
