import '../../components/app_drawer/app_drawer.dart';
import '../../material.dart';
import 'components/library_lists_section.dart';
import 'components/library_section_buttons.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: const AppDrawerLeadingButton(),
        title: Text('Library'),
        actions: [
          const AppBarSearchButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LibrarySectionButtons(),
                const SizedBox(height: 20.0),
                const LibraryListsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
