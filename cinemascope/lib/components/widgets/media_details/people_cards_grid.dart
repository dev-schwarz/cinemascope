import '../../../global/constants.dart';
import '../../../material.dart';
import '../../../repositories/tmdb/tmdb_repository.dart';
import '../../../stores/media/media_store.dart';

const _personCardTotalWidth = 130.0;
const _personCardDetailsHeight = 170.0;
const _personCardImageAspectRatio = 0.666666667;

const _personCardImageHeight = _personCardTotalWidth * _personCardImageAspectRatio;
const _personCardTotalHeight = _personCardImageHeight + _personCardDetailsHeight;
const _personCardAspectRatio = _personCardTotalHeight / _personCardTotalWidth;

class PeopleCardsGrid<T> extends StatelessWidget {
  const PeopleCardsGrid({
    Key key,
    @required this.data,
    @required this.cardDataBuilder,
    this.maxCardsToShow = kAppPersonCardsGridMaxItems,
    this.scrollDirection = Axis.horizontal,
    this.maxCrossAxisExtent = _personCardTotalHeight,
    this.mainAxisSpacing = 10.0,
    this.crossAxisSpacing = 20.0,
    this.childAspectRatio = _personCardAspectRatio,
  })  : assert(data != null),
        assert(cardDataBuilder != null),
        assert(maxCardsToShow != null),
        assert(scrollDirection != null),
        assert(maxCrossAxisExtent != null),
        assert(mainAxisSpacing != null),
        assert(crossAxisSpacing != null),
        assert(childAspectRatio != null),
        super(key: key);

  final List<T> data;
  final PersonCardData Function(T) cardDataBuilder;
  final int maxCardsToShow;
  final Axis scrollDirection;
  final double maxCrossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;

  List<T> _filterCards<T>(List<T> cards) => cards
      .cast()
      .map((e) => e.id)
//      .toSet()
      .map((id) => cards.cast().firstWhere((card) => card.id == id) as T)
      .toList()
      .cast<T>();

  @override
  Widget build(BuildContext context) {
    final cardsCount = maxCardsToShow.clamp(0, data.length);

    final cardsWidgets = _filterCards<T>(data).map((card) {
      final cardData = cardDataBuilder(card);
      return _PersonCard(
        key: key,
        cardData: cardData,
      );
    }).toList();

    //final cardsCount = maxCardsToShow.clamp(0, cardsWidgets.length);

    return CustomScrollView(
      shrinkWrap: true,
      primary: false,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: _personCardTotalHeight,
            width: _personCardTotalWidth,
            child: GridView.builder(
              scrollDirection: scrollDirection,
              itemCount: cardsCount,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: maxCrossAxisExtent,
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                childAspectRatio: childAspectRatio,
              ),
              itemBuilder: (context, index) {
                return Container(
                  alignment: const Alignment(0.0, 0.0),
                  child: cardsWidgets[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _PersonCard extends StatelessWidget {
  const _PersonCard({
    Key key,
    @required this.cardData,
  })  : assert(cardData != null),
        super(key: key);

  final PersonCardData cardData;

  static const _textShadowColor = const Color(0xff616161); // Colors.grey[700]

  // TODO: Put the result of this method in the app theme
  // It's also used in [_MediaPoster], in media_tiles_netflix.dart
  static Color _backgroundColor(BuildContext context) {
    int _clamp(int value) => value.clamp(0, 255);

    final addToAlpha = 25;
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    final increase =
        MediaQuery.of(context).platformBrightness == Brightness.dark ? addToAlpha : -addToAlpha;

    return Color.fromARGB(
      _clamp(scaffoldColor.alpha),
      _clamp(scaffoldColor.red + increase),
      _clamp(scaffoldColor.green + increase),
      _clamp(scaffoldColor.blue + increase),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileImage = cardData.profilePath != null
        ? Image.network(
            TmdbConfig.makeProfileUrl(cardData.profilePath, size: TmdbConfig.profileSize),
            height: _personCardImageHeight,
            width: _personCardTotalWidth,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation(kAppLoadingIndicatorColor),
                  value: loadingProgress?.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          )
        : Icon(
            Icons.person,
            size: kAppAlternativeMediaIconSize,
            color: Colors.grey[400],
          );

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.PERSON_DETAILS,
          arguments: PersonScreenArguments(
            personStore: PersonStore(
              id: cardData.id,
              dataStore: context.dataStore,
              // libraryStore: Provider.of<LibraryStore>(context, listen: false),
            ),
          ),
        );
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => PersonScreen(cardData.id),
        // ));
      },
      child: Container(
        height: _personCardTotalHeight,
        width: _personCardTotalWidth,
        // decoration of the card
        decoration: BoxDecoration(
          // TODO: Remove border of the card
//          border: Border.all(color: Colors.black, width: 1.0),
          color: _backgroundColor(context),
        ),
        child: ClipRRect(
          child: Column(
            children: <Widget>[
              // person's profile image
              AspectRatio(
                aspectRatio: _personCardImageAspectRatio,
                child: profileImage,
              ),
              const Divider(color: Colors.black38, height: 1.0, thickness: 2.0),
              // person's name and details
              Expanded(
                child: Container(
                  width: _personCardTotalWidth,
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              cardData.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.black,
                                shadows: <Shadow>[
                                  const Shadow(
                                    offset: const Offset(3.0, 3.0),
                                    color: _textShadowColor,
                                    blurRadius: 12.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          cardData.details,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black54,
                            fontSize: 13.0,
                            fontStyle: FontStyle.italic,
                            shadows: <Shadow>[
                              const Shadow(
                                offset: const Offset(6.0, 6.0),
                                color: _textShadowColor,
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Data used to build a Person Card in the [PeopleCardsGrid].
@immutable
class PersonCardData {
  const PersonCardData({
    @required this.id,
    this.name,
    this.details,
    this.profilePath,
  }) : assert(id != null);

  final int id;
  final String name;
  final String details;
  final String profilePath;
}
