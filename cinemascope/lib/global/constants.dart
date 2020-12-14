import 'package:flutter/material.dart';

const kAppTmdbProfileAspectRatio = 0.666666667;
const kAppTmdbPosterAspectRatio = 0.666666667;
const kAppTmdbBackdropAspectRatio = 1.777777778;

// const kAppParagraphIndent = '    ';

const kAppAppBarTitleSpacing = 8.0;

// const kAppScaffoldBackgroundColorLight = const Color(0xFFFAFAFA); // Colors.grey[50]
const kAppScaffoldBackgroundColorLight = const Color(0xFFEEEEEE); // Colors.grey[200]
const kAppScaffoldBackgroundColorDark = const Color(0xFF303030); // Colors.grey[850]

const kAppLoadingIndicatorColor = const Color(0xffbdbdbd);

const kAppListViewPadding = const EdgeInsets.all(4.0);

const kAppAlternativeMediaIconSize = 40.0;

/// Height to a person card in a [PeopleCardsGrid] (140.0).
/// Testar 180.0
const kAppPersonCardHeight = 220.0;

const kAppPersonCardsGridMaxItems = 20;

const kAppDataFetchDelayInMilliseconds = 500;

const kAppListViewDivider = Divider(
  color: Color(0xFFBDBDBD), // Colors.grey[400]
  height: 0.0,
);

const kAppPersonDepartmentOrder = <String, int>{
  'Directing': 100,
  'Writing': 90,
  'Production': 80,
};
