import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';
import 'package:formvalidation_app/src/features/domain/models/user.dart';
import 'package:formvalidation_app/src/features/domain/source/remote_user_datasource.dart';

class UserRepository {
  RemoteUserDatasource remoteDatasource;

  UserRepository({this.remoteDatasource});

  Future<UserToken> regiserUser(User user) async {
    return await remoteDatasource
        .register(user)
        .then((value) => _mapEitherToFuture(value));
  }

  Future<UserToken> loginUser(User user) async {
    return await remoteDatasource
        .login(user)
        .then((value) => _mapEitherToFuture(value));
  }

  Future<UserToken> _mapEitherToFuture(
      Either<ServerFailure, UserToken> value) async {
    return await value.fold((l) => null, (r) => _initToken(r));
  }

  Future<UserToken> _initToken(UserToken token) async {
    return token;
  }
}
