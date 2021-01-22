import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';
import 'package:formvalidation_app/src/features/data/remote/server/api/api_images_provider.dart';
import 'package:formvalidation_app/src/features/domain/source/remote_image_datasource.dart';

class RemoteImageDataSourceImpl implements RemoteImageDatasource {
  ApiImagesProvider provider;

  RemoteImageDataSourceImpl({this.provider});

  @override
  Future<Either<ServerFailure, String>> uploadImage(File image) async {
    final securityUrl = await provider.upload(image);
    return Right(securityUrl);
  }
}
