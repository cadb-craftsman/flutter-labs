import 'package:formvalidation_app/src/core/base/usecase_base.dart';
import 'package:formvalidation_app/src/features/domain/repositories/product_repository.dart';
import 'package:formvalidation_app/src/features/domain/usecases/params.dart';

class DeleteProductUseCase extends UseCaseBase<bool, Params> {
  ProductRepository repository = ProductRepository();

  DeleteProductUseCase({this.repository});

  @override
  Future<bool> call(Params params) async{
    await repository.deleteProduct(params.product);
  }
}
