import '../../components/app_drawer/app_drawer.dart';
import '../../material.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: const AppDrawerLeadingButton(),
        title: Text('Assignments'),
        actions: [
          const AppBarSearchButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          'Assignments',
          style: context.theme.textTheme.headline6,
        ),
      ),
    );
  }
}
