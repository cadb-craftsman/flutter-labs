import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';
import 'package:formvalidation_app/src/features/data/remote/mappers/products_mapper.dart'
    as mapper;
import 'package:formvalidation_app/src/features/data/remote/models/product_model.dart';
import 'package:formvalidation_app/src/features/data/remote/server/api/api_products_provider.dart';
import 'package:formvalidation_app/src/features/domain/models/product.dart';
import 'package:formvalidation_app/src/features/domain/source/remote_datasource.dart';

class RemoteProductDatasource implements RemoteDatasource {
  ApiProductsProvider productProvider;

  RemoteProductDatasource({this.productProvider});

  @override
  Future<Either<ServerFailure, bool>> createProduct(Product product) async {
    productProvider.create(mapper.productToProductModel(product));
  }

  @override
  Future<Either<ServerFailure, List<Product>>> getAllProducts() async {
    final List<ProductModel> productsModel = await productProvider.getAll();
    final List<Product> products = List();
    productsModel.forEach((productModel) {
      products.add(mapper.productModelToProduct(productModel));
    });
    return Right(products);
  }

  @override
  Future<Either<ServerFailure, bool>> deleteProduct(Product product) {
    productProvider.delete(mapper.productToProductModel(product));
  }

  @override
  Future<Either<ServerFailure, bool>> updateProduct(Product product) {
    productProvider.update(mapper.productToProductModel(product));
  }

  @override
  Future<Either<ServerFailure, String>> uploadImage(File image) async {
    final securityUrl = await productProvider.upload(image);
    return Right(securityUrl);
  }
}
