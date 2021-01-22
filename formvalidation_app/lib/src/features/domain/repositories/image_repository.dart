import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:formvalidation_app/src/core/error/failure.dart';
import 'package:formvalidation_app/src/features/domain/source/remote_image_datasource.dart';

class ImageRepository {
  RemoteImageDatasource remoteDatasource;

  ImageRepository({this.remoteDatasource});

  Future<String> uploadImage(File image) async {
    return await remoteDatasource
        .uploadImage(image)
        .then((value) => _mapEitherToFuture(value));
  }

  Future<String> _mapEitherToFuture(Either<ServerFailure, String> value) async {
    return await value.fold((l) => null, (r) => _initImageUrl(r));
  }

  Future<String> _initImageUrl(String imageUrl) async {
    return imageUrl;
  }
}
