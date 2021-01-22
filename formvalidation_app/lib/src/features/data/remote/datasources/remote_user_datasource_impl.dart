import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';
import 'package:formvalidation_app/src/features/data/remote/mappers/user_mapper.dart';
import 'package:formvalidation_app/src/features/data/remote/server/api/api_users_provider.dart';
import 'package:formvalidation_app/src/features/domain/models/user.dart';
import 'package:formvalidation_app/src/features/domain/source/remote_user_datasource.dart';

class RemoteUserDatasourceImpl implements RemoteUserDatasource {
  ApiUsersProvider provider;

  RemoteUserDatasourceImpl({this.provider});

  @override
  Future<Either<ServerFailure, UserToken>> register(User user) async {
    return Right(userTokenModelToUserToken(
        await provider.register(userToUserModel(user))));
  }

  @override
  Future<Either<ServerFailure, UserToken>> login(User user) async {
    return Right(
        userTokenModelToUserToken(await provider.login(userToUserModel(user))));
  }
}
