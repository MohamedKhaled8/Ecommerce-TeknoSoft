import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';

abstract class SearchController extends GetxController {}

class SearchControllerImp extends SearchController {
  List<ProductModel> searchList = <ProductModel>[];
  final List<ProductModel> producteList = <ProductModel>[];
  List<ProductModel> favoriteList = <ProductModel>[];
  final TextEditingController searchTextCont = TextEditingController();
  final HomeControllerImp _homeControllerImp = Get.put<HomeControllerImp>(HomeControllerImp());
  var getStorge = GetStorage();
  @override
  void onInit() {
    // ignore: unused_local_variable
    List? storedShoppings = getStorge.read<List>("isFavoriteList");

    if (storedShoppings != null) {
      favoriteList =
          storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    _homeControllerImp.getProudcts();
    super.onInit();
  }

  @override
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList = producteList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  @override
  void clearSearch() {
    searchTextCont.clear();
    addSearchToList("");
  }
}
