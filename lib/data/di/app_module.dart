import 'package:flutter_storage/data/model/product_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../database/config.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Database> provideDatabase() {
    return openDatabase(DemoDatabase.databaseName, version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE ${ProductEntity.tableName}(
          ${ProductEntity.columCode} TEXT PRIMARY KEY, 
          ${ProductEntity.columnName} TEXT, 
          ${ProductEntity.columnDescription} TEXT)
          """);
    });
  }
}
