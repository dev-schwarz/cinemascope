import '../../material.dart';
import '../../stores/results/results_store.dart';
import '../assignments/assignments_screen.dart';
import '../discover/movies/discover_movies_screen.dart';
import '../library/library_screen.dart';
import '../trending/trending_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _screenIndex = 0;
  List<_BottomNavBarItemData> _screensData;

  @override
  void initState() {
    super.initState();

    _screensData = [
      _BottomNavBarItemData(
        icon: Icons.trending_up,
        label: 'Trending',
        child: TrendingScreen(TrendingStore()),
      ),
      _BottomNavBarItemData(
        icon: Icons.new_releases,
        label: 'Discover',
        child: DiscoverMoviesScreen(),
      ),
      _BottomNavBarItemData(
        icon: Icons.assignment,
        label: 'Assignments',
        child: AssignmentsScreen(),
      ),
      _BottomNavBarItemData(
        icon: Icons.video_library,
        label: 'Library',
        child: LibraryScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: _screensData[_screenIndex].child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        backgroundColor: context.theme.canvasColor,
        unselectedItemColor: context.theme.unselectedWidgetColor,
        selectedItemColor: context.theme.accentColor,
        currentIndex: _screenIndex,
        onTap: _selectScreen,
        items: _bottomNavigationBarItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get _bottomNavigationBarItems {
    return _screensData
        .map<BottomNavigationBarItem>((screenData) => BottomNavigationBarItem(
              icon: Icon(screenData.icon),
              label: screenData.label,
            ))
        .toList();
  }

  void _selectScreen(int index) {
    setState(() {
      _screenIndex = index;
    });
  }
}

class _BottomNavBarItemData {
  const _BottomNavBarItemData({
    @required this.icon,
    @required this.label,
    @required this.child,
  });

  final IconData icon;
  final String label;
  final Widget child;
}

class _TempScreen extends StatelessWidget {
  const _TempScreen(this.title, {Key key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: context.theme.textTheme.headline6,
      ),
    );
  }
}
