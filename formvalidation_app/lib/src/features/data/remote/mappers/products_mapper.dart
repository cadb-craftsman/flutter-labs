import 'package:formvalidation_app/src/features/data/remote/models/product_model.dart';
import 'package:formvalidation_app/src/features/domain/models/product.dart';

ProductModel productToProductModel(Product product) {
  return new ProductModel(
      id: product.id,
      title: product.title,
      value: product.value,
      available: product.available,
      photoUrl: product.photoUrl);
}

Product productModelToProduct(ProductModel productModel) {
  return new Product(
      id: productModel.id,
      title: productModel.title,
      value: productModel.value,
      available: productModel.available,
      photoUrl: productModel.photoUrl);
}
