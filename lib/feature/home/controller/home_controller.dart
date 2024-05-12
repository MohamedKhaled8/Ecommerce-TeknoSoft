import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce/feature/home/data/model/banner_model.dart';
import 'package:ecommerce/feature/home/data/repo/category_repo.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';

abstract class HomeController extends GetxController {
  updatePageIndicator(int index);
  isShowMoreText();
  Future<void> fetchBanner();
  void addFavorite();
  void getProudcts();
  void mangeFavorite(int producteListId);
  isFavoriteId(int producteListId);
  void addSearchToList(String searchName);
  void clearSearch();
  void isShowFirstWidget();
}

class HomeControllerImp extends HomeController {
  int currentIndex = 0;
  bool isLoadingg = false;
  final CategoryRepo _categoryRepo = Get.put<CategoryRepo>(CategoryRepo());
  bool showFirstWidget = true;
  List<BannerModel> banner = [];
  final List<ProductModel> producteList = <ProductModel>[];
  List<ProductModel> favoriteList = <ProductModel>[];
  bool isFavorite = false;
  var getStorge = GetStorage();
  var isLoading = true;
  List<ProductModel> searchList = <ProductModel>[];

  /////////// cart

  double value = 0;
  bool isShowMore = true;
  double rating = 0;

  @override
  void isShowMoreText() {
    isShowMore = !isShowMore;
    update();
  }

  CarouselController carouselController = CarouselController();
// 1- Loading Data Category
 List<String> imagesSlider = [
      "assets/images/png/Preview.png",
      "assets/images/jpg/ads.jpg",
      "assets/images/jpg/5471204.jpg",
      "assets/images/jpg/jewelery.jpg",
      "assets/images/jpg/means.jpg",
      "assets/images/jpg/womensclothing.jpg",
    ];
  @override
  Future<void> fetchBanner() async {
    try {
      isLoadingg = true;

      final banner = await _categoryRepo.fetchBanner();

      this.banner.assignAll(banner);
    } catch (e) {
      Get.snackbar("On Snap!", e.toString());
    } finally {
      isLoadingg = false;
    }
    update();
  }

  @override
  void addFavorite() {
    isFavorite = !isFavorite;
    update();
  }

  @override
  void getProudcts() async {
    var product = await _categoryRepo.getProudct();
    try {
      isLoading = true;
      if (product.isNotEmpty) {
        producteList.addAll(product);
      }
    } finally {
      isLoading = false;
    }
    update();
  }

  @override
  void mangeFavorite(int producteListId) async {
    var indexWhere =
        favoriteList.indexWhere((element) => element.id == producteListId);
    if (indexWhere >= 0) {
      favoriteList.removeAt(indexWhere);
      await getStorge.remove("isFavoriteList");
    } else {
      favoriteList.add(
          producteList.firstWhere((element) => element.id == producteListId));
      await getStorge.write("isFavoriteList", favoriteList);
    }
    update();
  }

  @override
  bool isFavoriteId(int producteListId) {
    return favoriteList.any((element) => element.id == producteListId);
  }

  @override
  void updatePageIndicator(int index) {
    currentIndex = index;
    update();
  }

  final TextEditingController searchTextCont = TextEditingController();

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

  @override
  void isShowFirstWidget() {
    Future.delayed(const Duration(seconds: 5), () {
      showFirstWidget = false;
      update();
    });
  }

  @override
  void onInit() {
    List? storedShoppings = getStorge.read<List>("isFavoriteList");

    if (storedShoppings != null) {
      favoriteList =
          storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProudcts();
    isShowFirstWidget();
    fetchBanner();
    getProudcts();

    super.onInit();
  }
}
