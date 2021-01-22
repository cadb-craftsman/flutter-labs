
import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';
import 'package:formvalidation_app/src/features/domain/models/product.dart';

abstract class RemoteProductDatasource {
  Future<Either<ServerFailure, bool>> createProduct(Product product);

  Future<Either<ServerFailure, List<Product>>> getAllProducts();

  Future<Either<ServerFailure, bool>> deleteProduct(Product product);

  Future<Either<ServerFailure, bool>> updateProduct(Product product);


}
