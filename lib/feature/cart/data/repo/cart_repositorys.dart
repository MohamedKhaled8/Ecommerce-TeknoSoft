import 'package:dartz/dartz.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';

abstract class CartRepository {
  Either<String, Unit> addProductToCart({
    required ProductModel productModel,
    required Map<ProductModel, int> productsMap,
    required Set<String> savedProducts,
  });

  Either<String, Unit> removeOneProductFromCart({
    required ProductModel productModel,
    required Map<ProductModel, int> productsMap,
  });

  Either<String, Unit> removeProductFromCart({
    required ProductModel productModel,
    required Map<ProductModel, int> productsMap,
    required Set<String> savedProducts,
  });
}