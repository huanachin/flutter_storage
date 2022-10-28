import 'dart:async';

import 'package:flutter_storage/data/model/product_entity.dart';
import 'package:flutter_storage/data/repository/abstract/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc {
  final ProductRepository _productRepository;

  HomeBloc(this._productRepository);

  final _productsController = StreamController<List<ProductEntity>>();

  Stream<List<ProductEntity>> get productsStream => _productsController.stream;

  void updateProducts() async {
    final products = await _productRepository.getProducts();
    _productsController.add(products);
  }

  void insertProduct(ProductEntity product) {
    _productRepository.insertProduct(product);
    updateProducts();
  }

  void deleteProduct(String code) {
    _productRepository.deleteProduct(code);
    updateProducts();
  }
}
