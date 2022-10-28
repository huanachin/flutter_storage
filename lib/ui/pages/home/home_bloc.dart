import 'package:flutter_storage/data/repository/abstract/settings_repository.dart';

class HomeBloc {
  final SettingsRepository _settingsRepository;

  HomeBloc(this._settingsRepository);

  void setDarkMode(bool value) {
    _settingsRepository.setDarkMode(value);
  }

  bool isDarkMode() {
    return _settingsRepository.isDarkMode();
  }
}
