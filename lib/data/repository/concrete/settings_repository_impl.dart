import 'package:flutter_storage/data/database/config.dart';
import 'package:flutter_storage/data/repository/abstract/settings_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final Box _settingsBox;

  SettingsRepositoryImpl(this._settingsBox);

  @override
  bool isDarkMode() {
    return (_settingsBox.get(DemoDatabase.darkModeKey) as bool?) ?? false;
  }

  @override
  void setDarkMode(bool value) {
    _settingsBox.put(DemoDatabase.darkModeKey, value);
  }
}
