import 'package:flutter_storage/data/model/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();

  Future<int> insertProduct(ProductEntity product);

  Future<bool> deleteProduct(String code);
}
