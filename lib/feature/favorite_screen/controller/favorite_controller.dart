import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';

abstract class FavoriteController extends GetxController {
  isFavoriteId(int producteListId);
  void addFavorite();
  mangeFavorite(int producteListId);
}

class FavoriteControllerImp extends FavoriteController {
  List<ProductModel> favoriteList = <ProductModel>[].obs;
  bool isFavorite = false;
  var getStorge = GetStorage();
  final List<ProductModel> producteList = <ProductModel>[];

  @override
  bool isFavoriteId(int producteListId) {
    return favoriteList.any((element) => element.id == producteListId);
  }

  @override
  void addFavorite() {
    isFavorite = !isFavorite;
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
      if (producteList.isNotEmpty) {
        favoriteList.add(
            producteList.firstWhere((element) => element.id == producteListId));
        await getStorge.write("isFavoriteList", favoriteList);
      }
    }
    update();
  }

  @override
  void onInit() {
    List? storedShoppings = getStorge.read<List>("isFavoriteList");

    if (storedShoppings != null) {
      favoriteList =
          storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    super.onInit();
  }
}
