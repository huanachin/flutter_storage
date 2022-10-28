import 'package:flutter_storage/data/database/config.dart';
import 'package:flutter_storage/data/repository/abstract/settings_repository.dart';
import 'package:flutter_storage/data/repository/concrete/settings_repository_impl.dart';
import 'package:flutter_storage/ui/pages/home/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final dir = await getApplicationDocumentsDirectory();
  await BoxCollection.open(
    DemoDatabase.databaseName, // Name of your database
    {DemoDatabase.settingsBox}, // Names of your boxes
    path: dir.path,
  );
  final settingsBox = await Hive.openBox(DemoDatabase.settingsBox);
  getIt.registerFactory(() => settingsBox);
  getIt.registerFactory<SettingsRepository>(() => SettingsRepositoryImpl(getIt()));
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt()));
}
