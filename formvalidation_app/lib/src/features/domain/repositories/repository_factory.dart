import 'package:formvalidation_app/src/features/data/local/datasources/local_product_datasource.dart';
import 'package:formvalidation_app/src/features/data/remote/datasources/remote_product_datasource.dart';
import 'package:formvalidation_app/src/features/data/remote/server/providers/products_provider.dart';
import 'package:formvalidation_app/src/features/domain/repositories/image_repository.dart';
import 'package:formvalidation_app/src/features/domain/repositories/product_repository.dart';

class RepositoryFactory {
  static final RepositoryFactory _singleton = new RepositoryFactory();

  static RepositoryFactory getFactory() {
    return _singleton;
  }

  ProductRepository _productRepository;
  ImageRepository _imageRepository;

  ProductRepository get getProductRepository {
    if (_productRepository == null) {
      _productRepository = new ProductRepository(
          localDataSource: new LocalProductDatasource(),
          remoteDataSource: new RemoteProductDatasource(
              productProvider: new ProductProvider()));
    }
    return _productRepository;
  }

  ImageRepository get getImageRepository {
    if (_imageRepository == null) {
      _imageRepository = new ImageRepository(
          remoteDatasource: new RemoteProductDatasource(
              productProvider: new ProductProvider()));
    }
    return _imageRepository;
  }
}
