import 'dart:io';

abstract class ApiImagesProvider {
  //Upload an image to the Server
  Future<String> upload(File image);
}
