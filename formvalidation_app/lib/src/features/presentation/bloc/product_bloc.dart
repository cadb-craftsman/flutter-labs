import 'dart:io';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:formvalidation_app/src/features/domain/models/product.dart';
import 'package:formvalidation_app/src/features/domain/usecases/params.dart';
import 'package:formvalidation_app/src/features/domain/usecases/usecase_factory.dart';

class ProductBloc {
  static final ProductBloc _singleton = new ProductBloc._internal();

  factory ProductBloc() {
    return _singleton;
  }

  ProductBloc._internal() {
    getAllProducts();
  }

  final _productStreamController = BehaviorSubject<List<Product>>();

  Stream<List<Product>> get productStreamController =>
      _productStreamController.stream;

  dispose() {
    _productStreamController?.close();
  }

  createProduct(Product product) async {
    await UseCaseFactory.getFactory()
        .createProductUseCase
        .call(Params(product: product));
    getAllProducts();
  }

  getAllProducts() async {
    _productStreamController.sink.add(
        await UseCaseFactory.getFactory().getAllProductsUseCase.call(Params()));
  }

  deleteProduct(Product product) async {
    await UseCaseFactory.getFactory()
        .deleteProductUseCase
        .call(Params(product: product));
    getAllProducts();
  }

  updateProduct(Product product) async {
    await UseCaseFactory.getFactory()
        .updateProductUseCase
        .call(Params(product: product));
    getAllProducts();
  }

  Future<String> uploadImage(File image) async {
    return await UseCaseFactory.getFactory()
        .uploadImageUseCase
        .call(new ParamsFile(image: image));
  }
}
