import 'package:flutter_storage/data/model/product_entity.dart';
import 'package:flutter_storage/data/repository/abstract/product_repository.dart';

import '../../../objectbox.g.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Store _store;

  Box<ProductEntity> get _productBox => _store.box<ProductEntity>();

  ProductRepositoryImpl(this._store);

  @override
  Future<bool> deleteProduct(String code) {
    final result = _productBox.query(ProductEntity_.code.equals(code)).build().remove();
    return Future.value(result > 0);
  }

  @override
  Future<List<ProductEntity>> getProducts() {
    return Future.value(_productBox.getAll());
  }

  @override
  Future<int> insertProduct(ProductEntity product) {
    return Future.value(_productBox.put(product));
  }
}
