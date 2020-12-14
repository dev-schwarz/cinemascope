import 'package:mobx/mobx.dart';

import '../global/prefs_helper.dart';
import '../repositories/tmdb/tmdb_repository.dart';

part 'settings_store.g.dart';

enum SettingsState { initial, loading, saving, ok }

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  _SettingsStore() {
    loadSettings();
  }

  @observable
  SettingsState state = SettingsState.initial;

  @action
  void loadSettings() {
    TmdbConfig.posterSize = PosterSize.values[PrefsHelper().load<int>(
      PrefsKeys.posterSize,
      PosterSize.w92.index,
    )];

    TmdbConfig.profileSize = ProfileSize.values[PrefsHelper().load<int>(
      PrefsKeys.profileSize,
      ProfileSize.w45.index,
    )];

    TmdbConfig.language = TmdbConfigurationLanguage.values[PrefsHelper().load<int>(
      PrefsKeys.language,
      TmdbConfigurationLanguage.en_US.index,
    )];

    TmdbConfig.region = TmdbConfigurationRegion.values[PrefsHelper().load<int>(
      PrefsKeys.region,
      TmdbConfigurationRegion.US.index,
    )];

    TmdbConfig.includeAdult = PrefsHelper().load<bool>(
      PrefsKeys.includeAdult,
      false,
    );

    state = SettingsState.ok;
  }

  @action
  Future<void> saveSettings() async {
    state = SettingsState.saving;

    await PrefsHelper().save<int>(PrefsKeys.posterSize, TmdbConfig.posterSize.index);
    await PrefsHelper().save<int>(PrefsKeys.profileSize, TmdbConfig.profileSize.index);
    await PrefsHelper().save<int>(PrefsKeys.language, TmdbConfig.language.index);
    await PrefsHelper().save<int>(PrefsKeys.region, TmdbConfig.region.index);
    await PrefsHelper().save<bool>(PrefsKeys.includeAdult, TmdbConfig.includeAdult);

    state = SettingsState.ok;
  }
}
