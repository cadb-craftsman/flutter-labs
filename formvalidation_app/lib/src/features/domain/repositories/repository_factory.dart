import 'package:formvalidation_app/src/features/data/local/datasources/local_product_datasource_impl.dart';
import 'package:formvalidation_app/src/features/data/remote/datasources/remote_image_datasource_impl.dart';
import 'package:formvalidation_app/src/features/data/remote/datasources/remote_product_datasource_impl.dart';
import 'package:formvalidation_app/src/features/data/remote/datasources/remote_user_datasource_impl.dart';
import 'package:formvalidation_app/src/features/data/remote/server/providers/images_provider.dart';
import 'package:formvalidation_app/src/features/data/remote/server/providers/products_provider.dart';
import 'package:formvalidation_app/src/features/data/remote/server/providers/users_provider.dart';
import 'package:formvalidation_app/src/features/domain/repositories/image_repository.dart';
import 'package:formvalidation_app/src/features/domain/repositories/product_repository.dart';
import 'package:formvalidation_app/src/features/domain/repositories/user_repository.dart';

class RepositoryFactory {
  static final RepositoryFactory _singleton = new RepositoryFactory();

  static RepositoryFactory getFactory() {
    return _singleton;
  }

  ProductRepository _productRepository;
  ImageRepository _imageRepository;
  UserRepository _userRepository;

  ProductRepository get getProductRepository {
    if (_productRepository == null) {
      _productRepository = new ProductRepository(
          new LocalProductDatasourceImpl(),
          new RemoteProductDatasourceImpl(provider: new ProductProvider()));
    }
    return _productRepository;
  }

  ImageRepository get getImageRepository {
    if (_imageRepository == null) {
      _imageRepository = new ImageRepository(
          remoteDatasource:
              new RemoteImageDataSourceImpl(provider: new ImagesProvider()));
    }
    return _imageRepository;
  }

  UserRepository get getUserRepository {
    if (_userRepository == null) {
      _userRepository = new UserRepository(
          remoteDatasource:
              new RemoteUserDatasourceImpl(provider: new UsersProvider()));
    }

    return _userRepository;
  }
}
