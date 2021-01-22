import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:formvalidation_app/src/features/data/remote/server/api/api_images_provider.dart';

class ImagesProvider implements ApiImagesProvider {
  @override
  Future<String> upload(File image) async {
    final cloudinary = CloudinaryPublic(
      'di9ffipdp',
      'lvcr0fh8',
      cache: false,
    );
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        image.path,
        resourceType: CloudinaryResourceType.Image,
      ),
    );

    print(response.secureUrl);
    return response.secureUrl;
  }
}
