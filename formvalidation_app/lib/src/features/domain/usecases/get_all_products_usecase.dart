import 'package:formvalidation_app/src/core/base/usecase_base.dart';
import 'package:formvalidation_app/src/features/domain/models/product.dart';
import 'package:formvalidation_app/src/features/domain/repositories/product_repository.dart';
import 'package:formvalidation_app/src/features/domain/usecases/params.dart';

class GetAllProductsUseCase extends UseCaseBase<List<Product>, Params> {

  ProductRepository repository;

  GetAllProductsUseCase({this.repository});

  @override
  Future<List<Product>> call(Params params) async{
    return await repository.getAllProducts();
  }
}

