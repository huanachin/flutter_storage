// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i3;

import '../../ui/pages/home/home_bloc.dart' as _i6;
import '../repository/abstract/product_repository.dart' as _i4;
import '../repository/concrete/product_repository_impl.dart' as _i5;
import 'app_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.factoryAsync<_i3.Database>(
    () => appModule.provideDatabase(),
    preResolve: true,
  );
  gh.factory<_i4.ProductRepository>(
      () => _i5.ProductRepositoryImpl(get<_i3.Database>()));
  gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc(get<_i4.ProductRepository>()));
  return get;
}

class _$AppModule extends _i7.AppModule {}
