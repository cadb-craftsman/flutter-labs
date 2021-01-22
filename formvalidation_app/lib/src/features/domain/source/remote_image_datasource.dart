import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';

abstract class RemoteImageDatasource {
  Future<Either<ServerFailure, String>> uploadImage(File image);
}
