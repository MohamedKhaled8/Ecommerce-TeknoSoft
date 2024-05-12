import 'package:dartz/dartz.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/cart/data/repo/cart_repositorys.dart';

class CartRepositoryImp implements CartRepository {
  @override
  Either<String, Unit> addProductToCart({
    required ProductModel productModel,
    required Map<ProductModel, int> productsMap,
    required Set<String> savedProducts,
  }) {
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] = (productsMap[productModel] ?? 0) + 1;
    } else {
      productsMap[productModel] = 1;
      savedProducts.add(productModel.id.toString());
    }
    return right(unit);
  }

  @override
  Either<String, Unit> removeOneProductFromCart({
    required ProductModel productModel,
    required Map<ProductModel, int> productsMap,
  }) {
    if (productsMap.containsKey(productModel)) {
      if (productsMap[productModel] == 1) {
        productsMap.remove(productModel);
      } else {
        productsMap[productModel] = productsMap[productModel]! - 1;
      }
    }
    return right(unit);
  }

  @override
  Either<String, Unit> removeProductFromCart({
    required ProductModel productModel,
    required Map<ProductModel, int> productsMap,
    required Set<String> savedProducts,
  }) {
    productsMap.remove(productModel);
    savedProducts.remove(productModel.id.toString());
    return right(unit);
  }
}
