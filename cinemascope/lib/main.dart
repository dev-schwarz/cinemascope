import 'package:flutter/material.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import 'app.dart';
import 'global/prefs_helper.dart';
import 'repositories/tmdb/tmdb_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _initTmdbRepository();
  PrefsHelper.init().whenComplete(() {
    runApp(const CinemascopeApp());
  });
}

void _initTmdbRepository() {
  TmdbRepository.init(_initApi());
}

TmdbObjects _initApi() {
  return TmdbObjects(
    r'''ffea4ca1099c6f945cfe912e08056be2''',
    r'''eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1NmJlMiIsInN1YiI6IjVkM2ZhNWU5MzRlMTUyMWZiOGU3OWQ1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qLAhUehikWiZ8Oj8bHNZN5PSL2irXz-5mtcok9_NBtg''',
  );
}
