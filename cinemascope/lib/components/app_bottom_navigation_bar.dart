// import '../material.dart';

// class NavigationBarItemData {
//   const NavigationBarItemData({
//     @required this.label,
//     @required this.icon,
//     @required this.child,
//     @required this.routeName,
//   });

//   final String label;
//   final IconData icon;
//   final Widget child;
//   final String routeName;
// }

// class AppNavigationBar extends InheritedWidget {
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     // TODO: implement updateShouldNotify
//     throw UnimplementedError();
//   }
// }

// class _AppBottomNavigationBar extends StatefulWidget {
//   const _AppBottomNavigationBar({Key key}) : super(key: key);

//   @override
//   __AppBottomNavigationBarState createState() => __AppBottomNavigationBarState();
// }

// class __AppBottomNavigationBarState extends State<_AppBottomNavigationBar> {
//   int _itemIndex = 0;
//   List<NavigationBarItemData> _items;

//   @override
//   void initState() {
//     super.initState();
//     _items = _getItems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       showSelectedLabels: true,
//       backgroundColor: context.theme.canvasColor,
//       unselectedItemColor: context.theme.unselectedWidgetColor,
//       selectedItemColor: context.theme.accentColor,
//       onTap: _selectItem,
//       currentIndex: _itemIndex,
//       items: _getItems().map((item) {
//         return BottomNavigationBarItem(
//           icon: Icon(item.icon),
//           label: item.label,
//         );
//       }).toList(),
//     );
//   }

//   void _selectItem(int index) {
//     setState(() {
//       _itemIndex = index;
//     });
//     Navigator.of(context).pushNamed(_items[index].routeName);
//   }

//   List<NavigationBarItemData> _getItems() {
//     return [
//       NavigationBarItemData(
//         label: 'Trending',
//         icon: Icons.trending_up,
//         // child: TrendingScreen(TrendingStore()),
//         child: null,
//         routeName: AppRoutes.HOME_TRENDING,
//       ),
//       NavigationBarItemData(
//         label: 'Discover',
//         icon: Icons.new_releases,
//         // child: DiscoverMoviesScreen(),
//         child: null,
//         routeName: AppRoutes.HOME_DISCOVER,
//       ),
//       NavigationBarItemData(
//           label: 'Assignments',
//           icon: Icons.assignment,
//           // child: _TempScreen('Assignments'),
//           child: null,
//           routeName: AppRoutes.HOME_ASSIGNMENTS),
//       NavigationBarItemData(
//         label: 'Library',
//         icon: Icons.video_library,
//         // child: _TempScreen('Library'),
//         child: null,
//         routeName: AppRoutes.HOME_LIBRARY,
//       ),
//     ];
//   }
// }

// class _TempScreen extends StatelessWidget {
//   const _TempScreen(this.title, {Key key}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         title,
//         style: context.theme.textTheme.headline6,
//       ),
//     );
//   }
// }
