import 'package:flutter_storage/data/model/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();

  Future<void> insertProduct(ProductEntity product);

  Future<void> deleteProduct(String code);
}
