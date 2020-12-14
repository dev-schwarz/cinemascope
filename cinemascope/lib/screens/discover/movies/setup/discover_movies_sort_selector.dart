part of 'discover_movies_setup.dart';

class _DiscoverMoviesSortSelector extends StatelessWidget {
  const _DiscoverMoviesSortSelector(this.filterStore, {Key key}) : super(key: key);

  final DiscoverMoviesFilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            children: _makeSortChips(context),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: _makeOrderChip(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _makeSortChips(BuildContext context) {
    final sortText = <String>[
      'Popularity',
      'Original title',
      'Release date',
      'Vote average',
      'Vote count',
      'Revenue',
    ];

    return List<Widget>.generate(_sortValues.length, (index) {
      return Observer(builder: (_) {
        final isSelected = index == _sortValues.indexWhere((idx) => idx == filterStore.sortIndex);

        return ChoiceChip(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          selectedColor: Colors.blue[900],
          selected: isSelected,
          labelStyle: _getTextStyle(context, isSelected),
          onSelected: (selected) {
            filterStore.setSortIndex(selected ? _sortValues[index] : null);
          },
          label: SizedBox(
            height: 50.0,
            width: 90.0,
            child: Center(
              child: Text(
                sortText[index],
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      });
    }).toList();
  }

  Widget _makeOrderChip(BuildContext context) {
    final orderText = <String>[
      'Ascending',
      'Descending',
    ];

    return Observer(builder: (_) {
      return ActionChip(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        backgroundColor: Colors.blue[900],
        labelStyle: _getTextStyle(context, true),
        onPressed: () {
          filterStore.setSortOrderIndex(filterStore.sortOrderIndex == 0 ? 1 : 0);
        },
        label: SizedBox(
          height: 50.0,
          width: 180.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  filterStore.sortOrderIndex == 0
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: Colors.white60,
                ),
              ),
              Expanded(
                child: Text(
                  '${orderText[filterStore.sortOrderIndex]} order',
                  style: _getTextStyle(context, false),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  TextStyle _getTextStyle(BuildContext context, bool highlighted) {
    return context.theme.textTheme.button.copyWith(
      color: highlighted ? _highlightedColor : _color,
    );
  }

  static Color _color = Colors.white60;
  static Color _highlightedColor = Colors.lightBlue[200];

  static final _sortValues = <int>[
    DiscoverMovieSortBy.popularity.index,
    DiscoverMovieSortBy.originalTitle.index,
    DiscoverMovieSortBy.releaseDate.index,
    DiscoverMovieSortBy.voteAverage.index,
    DiscoverMovieSortBy.voteCount.index,
    DiscoverMovieSortBy.revenue.index,
  ];
}
