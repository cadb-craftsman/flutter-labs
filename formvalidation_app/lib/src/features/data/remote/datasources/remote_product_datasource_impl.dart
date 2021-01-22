import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';
import 'package:formvalidation_app/src/features/data/remote/mappers/products_mapper.dart'
    as mapper;
import 'package:formvalidation_app/src/features/data/remote/models/product_model.dart';
import 'package:formvalidation_app/src/features/data/remote/server/api/api_products_provider.dart';
import 'package:formvalidation_app/src/features/domain/models/product.dart';
import 'package:formvalidation_app/src/features/domain/source/remote_product_datasource.dart';

class RemoteProductDatasourceImpl implements RemoteProductDatasource {
  ApiProductsProvider provider;

  RemoteProductDatasourceImpl({this.provider});

  @override
  Future<Either<ServerFailure, bool>> createProduct(Product product) async {
    provider.create(mapper.productToProductModel(product));
  }

  @override
  Future<Either<ServerFailure, List<Product>>> getAllProducts() async {
    final List<ProductModel> productsModel = await provider.getAll();
    final List<Product> products = List();
    productsModel.forEach((productModel) {
      products.add(mapper.productModelToProduct(productModel));
    });
    return Right(products);
  }

  @override
  Future<Either<ServerFailure, bool>> deleteProduct(Product product) {
    provider.delete(mapper.productToProductModel(product));
  }

  @override
  Future<Either<ServerFailure, bool>> updateProduct(Product product) {
    provider.update(mapper.productToProductModel(product));
  }
}
