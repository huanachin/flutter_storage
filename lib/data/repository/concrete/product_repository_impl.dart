import 'package:flutter_storage/data/model/product_entity.dart';
import 'package:flutter_storage/data/repository/abstract/product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final Database _database;

  ProductRepositoryImpl(this._database);

  @override
  Future<void> deleteProduct(String code) {
    return _database.delete(
      ProductEntity.tableName,
      where: "${ProductEntity.columCode} = ?",
      whereArgs: [code],
    );
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    List<Map> maps = await _database.query(
      ProductEntity.tableName,
      columns: [
        ProductEntity.columCode,
        ProductEntity.columnName,
        ProductEntity.columnDescription,
      ],
    );
    return maps.map((e) => ProductEntity.fromMap(e)).toList();
  }

  @override
  Future<void> insertProduct(ProductEntity product) {
    return _database.insert(ProductEntity.tableName, product.toMap());
  }
}
