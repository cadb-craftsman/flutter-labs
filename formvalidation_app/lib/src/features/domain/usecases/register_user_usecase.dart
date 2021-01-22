import 'package:formvalidation_app/src/core/base/usecase_base.dart';
import 'package:formvalidation_app/src/features/domain/models/user.dart';
import 'package:formvalidation_app/src/features/domain/repositories/user_repository.dart';
import 'package:formvalidation_app/src/features/domain/usecases/params.dart';

class RegisterUserUseCase extends UseCaseBase<UserToken, ParamsUser> {
  UserRepository repository;

  RegisterUserUseCase({this.repository});

  @override
  Future<UserToken> call(ParamsUser params) async {
    return repository.regiserUser(params.user);
  }
}
