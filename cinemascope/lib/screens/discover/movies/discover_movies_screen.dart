import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../components/app_drawer/app_drawer.dart';
import '../../../material.dart';
import '../../../stores/results/results_store.dart';
import 'discover_movies_contents.dart';
import 'setup/discover_movies_setup.dart';

class DiscoverMoviesScreen extends StatefulWidget {
  const DiscoverMoviesScreen({Key key}) : super(key: key);

  @override
  _DiscoverMoviesScreenState createState() => _DiscoverMoviesScreenState();
}

class _DiscoverMoviesScreenState extends State<DiscoverMoviesScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  DiscoverMoviesStore _store;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        _store.viewStore.setAnimationValue(_animation.value);
      });

    _store = DiscoverMoviesStore(initialAnimationValue: _animation.value);
    _store.setupReactions();
    if (_store.state == FetchState.initial) {
      _store.fetchResults();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleOnWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: _appBarLeading,
          title: _appBarTitle,
          actions: _appBarActions,
        ),
        drawer: const AppDrawer(),
        body: Stack(
          children: [
            Observer(builder: (_) {
              return AbsorbPointer(
                absorbing: _store.viewStore.setupVisible,
                child: DiscoverMoviesContents(_store),
              );
            }),
            Observer(builder: (_) {
              return IgnorePointer(
                ignoring: !_store.viewStore.setupVisible,
                child: Opacity(
                  opacity: _store.viewStore.opacity,
                  child: DiscoverMoviesSetup(
                    _store,
                    opacity: _store.viewStore.setupDialogOpacity,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  List<Widget> get _appBarActions {
    return [
      Observer(
        builder: (_) {
          return Opacity(
            opacity: _store.viewStore.actionIconOpacity,
            child: IconButton(
              icon: Icon(_store.viewStore.actionIconData),
              tooltip: _store.viewStore.setupVisible ? 'Apply' : 'Setup Filters',
              disabledColor: context.theme.iconTheme.color,
              onPressed: _store.viewStore.isAnimating
                  ? null
                  : _store.viewStore.setupVisible
                      ? _onApplySetupFilter
                      : _showSetupDialog,
            ),
          );
        },
      ),
      Observer(
        builder: (_) {
          return !_store.viewStore.setupVisible ? const AppBarSearchButton() : Container();
        },
      ),
    ];
  }

  Widget get _appBarTitle {
    return Observer(
      builder: (_) {
        return Opacity(
          opacity: _store.viewStore.actionIconOpacity,
          child: Text(
            _store.viewStore.setupVisible ? 'Discover Movies Setup' : 'Discover Movies',
          ),
        );
      },
    );
  }

  Widget get _appBarLeading {
    return Observer(
      builder: (_) {
        if (_store.viewStore.setupVisible) {
          return Opacity(
            opacity: _store.viewStore.closeButtonOpacity,
            child: IconButton(
              icon: const Icon(Icons.close),
              disabledColor: context.theme.iconTheme.color,
              tooltip: 'Close',
              onPressed: _store.viewStore.isAnimating
                  ? null
                  : () {
                      _hideSetupDialog(true);
                    },
            ),
          );
        } else {
          return const AppDrawerLeadingButton();
        }
      },
    );
  }

  Future<bool> _handleOnWillPop() async {
    if (_store.viewStore.setupVisible) {
      _store.resetFilterStore();
      _hideSetupDialog(true);
      return false;
    }
    return true;
  }

  void _onApplySetupFilter() {
    _store.applyStoreFilter();
    _hideSetupDialog(false);
  }

  void _showSetupDialog() {
    _controller.forward();
  }

  void _hideSetupDialog(bool resetFilter) {
    FocusScope.of(context).unfocus();
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(() {})
      ..dispose();
    _store.dispose();
    super.dispose();
  }
}
