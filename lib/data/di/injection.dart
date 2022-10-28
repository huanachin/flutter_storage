import 'package:flutter_storage/data/repository/abstract/product_repository.dart';
import 'package:flutter_storage/data/repository/concrete/product_repository_impl.dart';
import 'package:flutter_storage/ui/pages/home/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../objectbox.g.dart';
import '../database/config.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final dir = await getApplicationDocumentsDirectory();
  final database = await openStore(directory: join(dir.path, DemoDatabase.databaseName));
  getIt.registerSingleton<Store>(database);
  getIt.registerFactory<ProductRepository>(() => ProductRepositoryImpl(getIt()));
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt()));
}
