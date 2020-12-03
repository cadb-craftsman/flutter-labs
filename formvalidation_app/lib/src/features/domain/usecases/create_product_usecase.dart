import 'package:formvalidation_app/src/core/base/usecase_base.dart';
import 'package:formvalidation_app/src/features/domain/repositories/product_repository.dart';
import 'package:formvalidation_app/src/features/domain/usecases/params.dart';

class CreateProductUseCase extends UseCaseBase<bool, Params> {
  ProductRepository repository = ProductRepository();

  CreateProductUseCase({this.repository});

  @override
  Future<bool> call(Params params) async {
    return await repository.createProduct(params.product);
  }
}
