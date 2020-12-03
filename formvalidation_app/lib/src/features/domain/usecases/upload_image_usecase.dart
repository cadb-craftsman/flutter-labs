import 'package:formvalidation_app/src/core/base/usecase_base.dart';
import 'package:formvalidation_app/src/features/domain/repositories/image_repository.dart';
import 'package:formvalidation_app/src/features/domain/usecases/params.dart';

class UploadImageUseCase extends UseCaseBase<String, ParamsFile> {
  ImageRepository repository = ImageRepository();

  UploadImageUseCase({this.repository});

  @override
  Future<String> call(ParamsFile params) async {
    return await repository.uploadImage(params.image);
  }
}
