import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/error/failures.dart';
import 'package:ecommerce/core/utils/themes/snakBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/cart/data/repo/cart_repositorysimp.dart';

abstract class CartController extends GetxController {
  void addProductToCard(ProductModel productModel);
  void clearAllProductToCard(BuildContext context);
  void valueChange(double value);
  isCompletPro();
  void removeOneProductFromCard(ProductModel productModel);
  void removeProductFromCard(ProductModel productModel);
  int quantity();
  void handleSuccess();
  bool isProductInCart(ProductModel productModel);
}

class CartControllerImp extends CartController {
  final Map<ProductModel, int> productsMap = {};
  bool isAddProduct = false;
  late SharedPreferences _prefs;
  late Set<String> _savedProducts;

  final CartRepositoryImp _cartRepositorys = CartRepositoryImp();

  @override
  void onInit() {
    super.onInit();
    _loadCart();
  }

  Future<void> _saveCart() async {
    _prefs = await SharedPreferences.getInstance();
    var encodedMap = productsMap.map((key, value) {
      return MapEntry(json.encode(key.toJson()), value);
    });
    await _prefs.setString('cart', json.encode(encodedMap));
    await _prefs.setStringList('savedProducts', _savedProducts.toList());
  }

  Future<void> _loadCart() async {
    _prefs = await SharedPreferences.getInstance();
    String? cartString = _prefs.getString('cart');
    List<String>? savedProductsList = _prefs.getStringList('savedProducts');
    _savedProducts = savedProductsList != null ? savedProductsList.toSet() : {};

    if (cartString != null) {
      Map<String, dynamic> map = json.decode(cartString);
      productsMap.clear();
      map.forEach((key, value) {
        ProductModel product = ProductModel.fromJson(json.decode(key));
        productsMap[product] = value;
      });
      update();
    }
  }

  @override
  void addProductToCard(ProductModel productModel) {
    final result = _cartRepositorys.addProductToCart(
      productModel: productModel,
      productsMap: productsMap,
      savedProducts: _savedProducts,
    );
    result.fold(
      (error) {
        final errorMessage = ErrorMessages.handleError(error);
        errorMessage.fold(
          (errorMsg) {
            Get.snackbar(
              "Error",
              errorMsg,
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          (_) => handleSuccess(),
        );
      },
      (_) => handleSuccess(),
    );
  }

  @override
  void isCompletPro() {
    isAddProduct = !isAddProduct;
    update();
  }

  @override
  void valueChange(double value) {
    value = value;
    update();
  }

  @override
  void clearAllProductToCard(BuildContext context) {
    snakBarClearAllItems(productsMap: productsMap, context: context);
    update();
  }

  @override
  void removeOneProductFromCard(ProductModel productModel) {
    final result = _cartRepositorys.removeOneProductFromCart(
        productModel: productModel, productsMap: productsMap);
    result.fold(
      (error) {
        final errorMessage = ErrorMessages.handleError(error);
        errorMessage.fold(
          (errorMsg) {
            Get.snackbar(
              "Error",
              errorMsg,
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          (_) => handleSuccess(),
        );
      },
      (_) => handleSuccess(),
    );
  }

  void handleProductAction(
      ProductModel productModel, BuildContext context, int index) {
    bool isInCart = isProductInCart(productModel);

    List<String> actionMessage = [
      "Added",
      "Delete",
    ];

    update();

    ECustomShowDialogeAddAndREmovePeoduct(
        context, actionMessage, index, isInCart);
  }

  @override
  void removeProductFromCard(ProductModel productModel) {
    final result = _cartRepositorys.removeProductFromCart(
      productModel: productModel,
      productsMap: productsMap,
      savedProducts: _savedProducts,
    );
    result.fold(
      (error) {
        final errorMessage = ErrorMessages.handleError(error);
        errorMessage.fold(
          (errorMsg) {
            Get.snackbar(
              "Error",
              errorMsg,
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          (_) => handleSuccess(),
        );
      },
      (_) => handleSuccess(),
    );
  }

  get subTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();
  get getTotal => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  @override
  int quantity() {
    int totalQuantity = 0;
    productsMap.values.forEach((quantity) {
      totalQuantity += quantity;
    });
    return totalQuantity;
  }

  @override
  bool isProductInCart(ProductModel productModel) {
    return _savedProducts.contains(productModel.id.toString());
  }

  @override
  void handleSuccess() {
    _saveCart();
    update();
  }
}
