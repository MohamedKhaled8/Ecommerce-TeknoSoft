import 'package:get/get.dart';
import 'package:ecommerce/feature/home/data/repo/category_repo.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/home/data/model/category_modeld.dart';

abstract class CategoryController extends GetxController {
  void getCategorys();
  getAllCategorys(String namecategory);
  getCategoryIndex(int index);
}

class CategoryControllerImp extends CategoryController {
  List<CategoryModel> allCategoryies = [];
  List<CategoryModel> featuredCategories = [];
  var categoryNameList = <String>[];
  var categoryList = <ProductModel>[];
  final CategoryRepo _categoryRepo = Get.put<CategoryRepo>(CategoryRepo());
  bool isLoadingg = false;
  var isCatgeoryLoading = false;
  var isAllCategory = false;

  @override
  void getCategorys() async {
    var categoryName = await _categoryRepo.getCategory();

    try {
      isCatgeoryLoading = true;
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCatgeoryLoading = false;
    }
    update();
  }

  @override
  getAllCategorys(String namecategory) async {
    isAllCategory = true;

    categoryList = await _categoryRepo.getAllCategoryy(namecategory);
    isAllCategory = false;
    update();
  }

  @override
  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);
    if (categoryAllName != null) {
      categoryList = categoryAllName;
    }
  }

  Future<void> fetchCategories() async {
    try {
      isLoadingg = true;

      final categories = await _categoryRepo.getAllCategoriesss();
      allCategoryies.assignAll(categories);

      featuredCategories.assignAll(allCategoryies
          .where((element) => element.isFeatured && element.parentld.isEmail)
          .take(8)
          .toList());
    } catch (e) {
      Get.snackbar("Oh Snap!", e.toString());
    } finally {
      isLoadingg = false;
      update();
    }
    update();
  }

  @override
  void onInit() {
    fetchCategories();
    getCategorys();
    super.onInit();
  }
}
