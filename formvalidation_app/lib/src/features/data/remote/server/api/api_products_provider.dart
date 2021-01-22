import 'dart:io';

import 'package:formvalidation_app/src/features/data/remote/models/product_model.dart';

abstract class ApiProductsProvider {
  //Create a new Product with Post method
  Future<bool> create(ProductModel productModel);

  //Get all products of the api server
  Future<List<ProductModel>> getAll();

  //Delete a selected product from the api server
  Future<bool> delete(ProductModel productModel);

  //Create a new Product with Post method
  Future<bool> update(ProductModel productModel);
}
