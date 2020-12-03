import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';
import 'package:formvalidation_app/src/features/domain/models/product.dart';
import 'package:formvalidation_app/src/features/domain/source/local_datasource.dart';
import 'package:formvalidation_app/src/features/domain/source/remote_datasource.dart';

class ProductRepository {
  LocalDatasource localDataSource;
  RemoteDatasource remoteDataSource;

  ProductRepository({this.localDataSource, this.remoteDataSource});

  Future<bool> createProduct(Product product) async {
    await remoteDataSource.createProduct(product);
  }

  Future<List<Product>> getAllProducts() async {
    return await remoteDataSource
        .getAllProducts()
        .then((value) => _mapEitherToFuture(value));
  }

  Future<bool> deleteProduct(Product product) async {
    await remoteDataSource.deleteProduct(product);
  }

  Future<bool> updateProduct(Product product) async {
    await remoteDataSource.updateProduct(product);
  }

  Future<List<Product>> _mapEitherToFuture(
      Either<ServerFailure, List<Product>> value) async {
    return await value.fold((l) => null, (r) => _initProducts(r));
  }

  Future<List<Product>> _initProducts(List<Product> productList) async {
    return productList;
  }
}
