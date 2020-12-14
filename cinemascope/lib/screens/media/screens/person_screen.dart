import 'package:tmdb_objects/tmdb_objects.dart';

import '../../../components/helpers/tmdb_helper_mixin.dart';
import '../../../material.dart';
import '../../../stores/media/media_store.dart';
import '../base/media_helper_mixin.dart';
import '../base/media_sliver_delegate.dart';
import '../components/button_bar/button_bar.dart';
import '../components/popularity_indicator.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen(this.store, {Key key}) : super(key: key);

  final PersonStore store;

  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen>
    with MediaHelperMixin<Person, PersonScreen>, TmdbHelperMixin {
  String get _personAgeInfo {
    if (mediaDetails.birthday == null) return null;

    String info = formatDate(mediaDetails.birthday);
    if (mediaDetails.deathday == null)
      info += '  (${calculateAge(mediaDetails.birthday)}) years';
    else
      info += '  ─  ${formatDate(mediaDetails.deathday)}';

    return info;
  }

  Widget _buildBiography() {
    if ((mediaDetails?.biography ?? '').isEmpty) return null;

    return CustomExpansionTile(
      contentPadding: const EdgeInsets.all(16.0),
      decoration: getCustomExpansionTileDecoration(context),
      title: 'Biography',
      titleStyle: customExpansionTileTitleStyle,
      children: <Widget>[
        IndentedText(
          mediaDetails.biography,
          textAlign: TextAlign.justify,
          style: context.theme.textTheme.bodyText1,
        ),
      ],
    );
  }

  PopularitySentiment get _sentiment {
    if (mediaDetails.popularity >= 35) {
      return PopularitySentiment.verySatisfied;
    } else if (mediaDetails.popularity >= 25) {
      return PopularitySentiment.satisfied;
    } else if (mediaDetails.popularity >= 10) {
      return PopularitySentiment.neutral;
    } else if (mediaDetails.popularity >= 5) {
      return PopularitySentiment.dissatisfied;
    } else {
      return PopularitySentiment.veryDissatisfied;
    }
  }

  @override
  List<Widget> buildContents() {
    final items = <Widget>[];

    items.addAll([
      trailingTopPopularityIndicator(_sentiment),
      divider(),
      info('Place of birth:', mediaDetails.placeOfBirth, errorText: 'Not available'),
    ]);

    items.addAll([
      divider(),
      _buildBiography(),
    ]);

    return items;
  }

  @override
  MediaButtonBar makeButtonBar() {
    return null;
  }

  @override
  MediaSliverDelegate makeHeaderDelegate() {
    return MediaSliverDelegate(
      resumedMedia: resumedMedia,
      title: resumedMedia.name,
      contents: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _personAgeInfo ?? '',
              textAlign: TextAlign.end,
              style: context.appTheme.mediaDetailsTheme.headerBottomTextStyle,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget makeTopLeadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Known for:',
          style: context.theme.textTheme.headline6.copyWith(fontSize: 16.0),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            mediaDetails?.knownForDepartment ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  MediaStore<Person> get mediaStore => widget.store;
}
