import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../../../material.dart';
import '../../../../stores/results/results_store.dart';
import '../../components/setup_components.dart';

part 'discover_movies_sort_selector.dart';

class DiscoverMoviesSetup extends StatefulWidget {
  const DiscoverMoviesSetup(this.store, {Key key, this.opacity}) : super(key: key);

  final DiscoverMoviesStore store;
  final double opacity;

  @override
  _DiscoverMoviesSetupState createState() => _DiscoverMoviesSetupState();
}

class _DiscoverMoviesSetupState extends State<DiscoverMoviesSetup> {
  final TextEditingController _yearController = TextEditingController();

  DiscoverMoviesFilterStore _filterStore;
  ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();

    _filterStore = widget.store.filterStore;
    _disposer = reaction((_) => _filterStore.year, (value) {
      if (value == null) {
        _yearController.clear();
      } else {
        _yearController.value = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor.withOpacity(widget.opacity),
      child: DiscoverSetupContents(
        title: 'Discover Setup',
        onCancel: () {
          print('onCancel');
          _onCancel(context);
        },
        onApply: () {
          print('onApply');
          _onApply(context);
        },
        children: [
          _DiscoverMoviesSortSelector(_filterStore),
          // [[ year ]]
          DiscoverSetupFieldTitle(
            title: 'Year',
            subtitle: 'of release',
          ),
          Observer(builder: (_) {
            return TextFormField(
              controller: _yearController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Sample: 2004',
                isDense: true,
                errorText: _filterStore.yearError,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _filterStore.setYear(null);
                  },
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: _filterStore.setYear,
            );
          }),
        ],
      ),
    );
  }

  void _onCancel(BuildContext context) {
    widget.store.resetFilterStore();
    _closeSetup(context);
  }

  void _onApply(BuildContext context) {
    widget.store.applyStoreFilter();
    _closeSetup(context);
  }

  void _closeSetup(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _yearController.dispose();
    _disposer();
    super.dispose();
  }
}
