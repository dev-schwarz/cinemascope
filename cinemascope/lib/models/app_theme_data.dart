import 'package:flutter/material.dart';

/// Tema customizado do app.
@immutable
class AppThemeData {
  factory AppThemeData({
    @required Brightness brightness,
    @required NavigationBarThemeData navigationBarTheme,
    @required MediaDetailsThemeData mediaDetailsTheme,
    @required MediaTileThemeData mediaTileTheme,
    @required BigButtonThemeData bigButtonTheme,
  }) {
    brightness ??= Brightness.light;
    return AppThemeData.raw(
      brightness: brightness,
      navigationBarTheme: navigationBarTheme,
      mediaDetailsTheme: mediaDetailsTheme,
      mediaTileTheme: mediaTileTheme,
      bigButtonTheme: bigButtonTheme,
    );
  }

  final Brightness brightness;
  final NavigationBarThemeData navigationBarTheme;
  final MediaDetailsThemeData mediaDetailsTheme;
  final MediaTileThemeData mediaTileTheme;
  final BigButtonThemeData bigButtonTheme;

  const AppThemeData.raw({
    @required this.brightness,
    @required this.navigationBarTheme,
    @required this.mediaDetailsTheme,
    @required this.mediaTileTheme,
    @required this.bigButtonTheme,
  })  : assert(brightness != null),
        assert(navigationBarTheme != null),
        assert(mediaDetailsTheme != null),
        assert(mediaTileTheme != null),
        assert(bigButtonTheme != null);

  AppThemeData copyWith(
    Brightness brightness,
    NavigationBarThemeData navigationBarTheme,
    MediaDetailsThemeData mediaDetailsTheme,
    MediaTileThemeData mediaTileTheme,
    BigButtonThemeData bigButtonTheme,
  ) {
    return AppThemeData.raw(
      brightness: brightness ?? this.brightness,
      navigationBarTheme: navigationBarTheme ?? this.navigationBarTheme,
      mediaDetailsTheme: mediaDetailsTheme ?? this.mediaDetailsTheme,
      mediaTileTheme: mediaTileTheme ?? this.mediaTileTheme,
      bigButtonTheme: bigButtonTheme ?? this.bigButtonTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is AppThemeData &&
        brightness == other.brightness &&
        navigationBarTheme == other.navigationBarTheme &&
        mediaDetailsTheme == other.mediaDetailsTheme &&
        mediaTileTheme == other.mediaTileTheme;
  }

  @override
  int get hashCode {
    final List<Object> values = <Object>[
      brightness,
      navigationBarTheme,
      mediaDetailsTheme,
      mediaTileTheme,
    ];
    return hashList(values);
  }
}

@immutable
class NavigationBarThemeData {
  const NavigationBarThemeData({
    this.color,
    this.highlightedColor,
    this.textStyle,
  });

  final Color color;
  final Color highlightedColor;
  final TextStyle textStyle;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is NavigationBarThemeData &&
        color == other.color &&
        highlightedColor == other.highlightedColor &&
        textStyle == other.textStyle;
  }

  @override
  int get hashCode {
    return hashValues(
      color,
      highlightedColor,
      textStyle,
    );
  }
}

@immutable
class BigButtonThemeData {
  const BigButtonThemeData({
    @required this.textColor,
    @required this.backgroundColor,
    @required this.iconColor,
    @required this.hintTextStyle,
    @required this.hintBackgroundColor,
  });

  final Color textColor;
  final Color backgroundColor;
  final Color iconColor;
  final TextStyle hintTextStyle;
  final Color hintBackgroundColor;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is BigButtonThemeData &&
        textColor == other.textColor &&
        backgroundColor == other.backgroundColor &&
        iconColor == other.iconColor &&
        hintTextStyle == other.hintTextStyle &&
        hintBackgroundColor == other.hintBackgroundColor;
  }

  @override
  int get hashCode {
    return hashValues(
      textColor,
      backgroundColor,
      iconColor,
      hintTextStyle,
      hintBackgroundColor,
    );
  }
}

@immutable
class ActionsBarThemeData {
  const ActionsBarThemeData({
    @required Color buttonColor,
//    @required Color buttonSplashColor,
//    @required Color buttonHighlightColor,
    @required TextStyle buttonTextStyle,
  })  : buttonColor = buttonColor,
//        buttonSplashColor = buttonSplashColor,
//        buttonHighlightColor = buttonHighlightColor,
        buttonTextStyle = buttonTextStyle;

  final Color buttonColor;

//  final Color buttonSplashColor;
//  final Color buttonHighlightColor;
  final TextStyle buttonTextStyle;

  Color get buttonSplashColor => buttonColor.withOpacity(0.13);

  Color get buttonHighlightColor => buttonColor.withOpacity(0.1);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ActionsBarThemeData &&
        buttonColor == other.buttonColor &&
//        buttonSplashColor == other.buttonSplashColor &&
//        buttonHighlightColor == other.buttonHighlightColor &&
        buttonTextStyle == other.buttonTextStyle;
  }

  @override
  int get hashCode {
    return hashValues(
      buttonColor,
//      buttonSplashColor,
//      buttonHighlightColor,
      buttonTextStyle,
    );
  }
}

/// Tema para a tela que exibe os detalhes de uma midia.
@immutable
class MediaDetailsThemeData {
  const MediaDetailsThemeData({
    @required Color appBarBackButtonColor,
    @required Color appBarBackButtonBackgroundColor,
    @required TextStyle appBarTextStyle1,
    @required TextStyle appBarTextStyle2,
    @required Color headerBackgroundColor,
    @required TextStyle headerBottomTextStyle,
    @required Color headerMediaIconCardColor,
    @required Color headerMediaIconCardBackgroundColor,
    @required TextStyle linkTextStyle,
    @required ActionsBarThemeData actionsBarTheme,
  })  : appBarBackButtonColor = appBarBackButtonColor,
        appBarBackButtonBackgroundColor = appBarBackButtonBackgroundColor,
        appBarTextStyle1 = appBarTextStyle1,
        appBarTextStyle2 = appBarTextStyle2,
        headerBackgroundColor = headerBackgroundColor,
        headerBottomTextStyle = headerBottomTextStyle,
        headerMediaIconCardColor = headerMediaIconCardColor,
        headerMediaIconCardBackgroundColor = headerMediaIconCardBackgroundColor,
        linkTextStyle = linkTextStyle,
        actionsBarTheme = actionsBarTheme;

  final Color appBarBackButtonColor;
  final Color appBarBackButtonBackgroundColor;
  final TextStyle appBarTextStyle1;
  final TextStyle appBarTextStyle2;
  final Color headerBackgroundColor;
  final TextStyle headerBottomTextStyle;
  final Color headerMediaIconCardColor;
  final Color headerMediaIconCardBackgroundColor;
  final TextStyle linkTextStyle;
  final ActionsBarThemeData actionsBarTheme;

  MediaDetailsThemeData copyWith({
    Color appBarBackButtonColor,
    Color appBarBackButtonBackgroundColor,
    TextStyle appBarTextStyle1,
    TextStyle appBarTextStyle2,
    Color headerBackgroundColor,
    TextStyle headerBottomTextStyle,
    Color headerMediaIconCardColor,
    Color headerMediaIconCardBackgroundColor,
    TextStyle linkTextStyle,
    ActionsBarThemeData actionsBarTheme,
  }) {
    return MediaDetailsThemeData(
      appBarBackButtonColor: appBarBackButtonColor ?? this.appBarBackButtonColor,
      appBarBackButtonBackgroundColor:
          appBarBackButtonBackgroundColor ?? this.appBarBackButtonBackgroundColor,
      appBarTextStyle1: appBarTextStyle1 ?? this.appBarTextStyle1,
      appBarTextStyle2: appBarTextStyle2 ?? this.appBarTextStyle2,
      headerBackgroundColor: headerBackgroundColor ?? this.headerBackgroundColor,
      headerBottomTextStyle: headerBottomTextStyle ?? this.headerBottomTextStyle,
      headerMediaIconCardColor: headerMediaIconCardColor ?? this.headerMediaIconCardColor,
      headerMediaIconCardBackgroundColor:
          headerMediaIconCardBackgroundColor ?? this.headerMediaIconCardBackgroundColor,
      linkTextStyle: linkTextStyle ?? this.linkTextStyle,
      actionsBarTheme: actionsBarTheme ?? this.actionsBarTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is MediaDetailsThemeData &&
        appBarBackButtonColor == other.appBarBackButtonColor &&
        appBarBackButtonBackgroundColor == other.appBarBackButtonBackgroundColor &&
        appBarTextStyle1 == other.appBarTextStyle1 &&
        appBarTextStyle2 == other.appBarTextStyle2 &&
        headerBackgroundColor == other.headerBackgroundColor &&
        headerBottomTextStyle == other.headerBottomTextStyle &&
        headerMediaIconCardColor == other.headerMediaIconCardColor &&
        headerMediaIconCardBackgroundColor == other.headerMediaIconCardBackgroundColor &&
        linkTextStyle == other.linkTextStyle &&
        actionsBarTheme == other.actionsBarTheme;
  }

  @override
  int get hashCode {
    return hashValues(
      appBarBackButtonColor,
      appBarBackButtonBackgroundColor,
      appBarTextStyle1,
      appBarTextStyle2,
      headerBackgroundColor,
      headerBottomTextStyle,
      headerMediaIconCardColor,
      headerMediaIconCardBackgroundColor,
      linkTextStyle,
      actionsBarTheme,
    );
  }
}

/// Tema para uma media tile de midia.
@immutable
class MediaTileThemeData {
  const MediaTileThemeData({
    @required Color mediaIconColor,
    @required TextStyle titleTextStyle,
    @required TextStyle descriptionTextStyle,
    @required TextStyle bottomTextStyle,
    @required Color posterBackgroundColor,
  })  : mediaIconColor = mediaIconColor,
        titleTextStyle = titleTextStyle,
        descriptionTextStyle = descriptionTextStyle,
        bottomTextStyle = bottomTextStyle,
        posterBackgroundColor = posterBackgroundColor;

  /// Cor do icone da midia.
  final Color mediaIconColor;

  /// [TextStyle] do titulo da midia.
  final TextStyle titleTextStyle;

  /// [TextStyle] da descricao da midia.
  final TextStyle descriptionTextStyle;

  /// [TextStyle] do text de rodape da tile.
  final TextStyle bottomTextStyle;

  /// Cor de fundo do poster, para quando este nao estiver disponivel.
  final Color posterBackgroundColor;

  MediaTileThemeData copyWith({
    Color mediaIconColor,
    TextStyle titleTextStyle,
    TextStyle descriptionTextStyle,
    TextStyle bottomTextStyle,
    Color posterBackgroundColor,
  }) {
    return MediaTileThemeData(
      mediaIconColor: mediaIconColor ?? this.mediaIconColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      descriptionTextStyle: descriptionTextStyle ?? this.descriptionTextStyle,
      bottomTextStyle: bottomTextStyle ?? this.bottomTextStyle,
      posterBackgroundColor: posterBackgroundColor ?? this.posterBackgroundColor,
    );
  }

  MediaTileThemeData merge(MediaTileThemeData other) {
    if (other == null) return this;
    return copyWith(
      mediaIconColor: other?.mediaIconColor,
      titleTextStyle: titleTextStyle?.merge(other.titleTextStyle) ?? other.titleTextStyle,
      descriptionTextStyle:
          descriptionTextStyle?.merge(other.descriptionTextStyle) ?? other.descriptionTextStyle,
      bottomTextStyle: bottomTextStyle?.merge(other.bottomTextStyle) ?? other.bottomTextStyle,
      posterBackgroundColor: other?.posterBackgroundColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is MediaTileThemeData &&
        mediaIconColor == other.mediaIconColor &&
        titleTextStyle == other.titleTextStyle &&
        descriptionTextStyle == other.descriptionTextStyle &&
        bottomTextStyle == other.bottomTextStyle &&
        posterBackgroundColor == other.posterBackgroundColor;
  }

  @override
  int get hashCode {
    // The hashValues() function supports up to 20 arguments.
    return hashValues(
      mediaIconColor,
      titleTextStyle,
      descriptionTextStyle,
      bottomTextStyle,
      posterBackgroundColor,
    );
  }
}
