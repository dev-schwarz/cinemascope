import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

mixin TmdbHelperMixin {
  IconData getMediaTypeIcon(TMediaType mediaType) {
    switch (mediaType.toString()) {
      case 'movie':
        return Icons.local_movies;
      case 'tv':
        return Icons.ondemand_video;
      case 'person':
        return Icons.person;
      default:
        return Icons.play_arrow;
    }
  }

  String firstLetterUCase(String value) {
    return '${value[0].toUpperCase()}${value.substring(1)}';
  }

  String formatCurrency(int value) {
    final formatter = NumberFormat.currency(locale: Intl.getCurrentLocale(), symbol: '\$');
    return formatter.format(value);
  }

  String formatDate(DateTime dt) {
    var pattern = DateFormat.yMd().pattern;
    return DateFormat(pattern).format(dt);
  }

  int calculateAge(DateTime birthDate) {
    if (birthDate == null) return null;

    DateTime nowDate = DateTime.now();
    int age = nowDate.year - birthDate.year;
    int nowMonth = nowDate.month;
    int birthMonth = birthDate.month;
    if (birthMonth > nowMonth) {
      age--;
    } else if (nowMonth == birthMonth) {
      int nowDay = nowDate.day;
      int birthDay = birthDate.day;
      if (birthDay > nowDay) {
        age--;
      }
    }
    return age;
  }
}
