import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';
import 'package:formvalidation_app/src/features/domain/models/user.dart';

abstract class RemoteUserDatasource {
  Future<Either<ServerFailure, UserToken>> register(User user);
  Future<Either<ServerFailure, UserToken>> login(User user);
}
