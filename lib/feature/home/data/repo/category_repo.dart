import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/utils/error/handel_error.dart';
import 'package:ecommerce/core/utils/helper/end_point_helper.dart';
import 'package:ecommerce/feature/home/data/model/banner_model.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/home/data/model/category_model.dart';
import 'package:ecommerce/feature/home/data/model/category_modeld.dart';
import 'package:ecommerce/core/utils/services/e_firebase_firestore_services.dart';

class CategoryRepo extends GetxController {
  static CategoryRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategoriesss() async {
    try {
      final snapShot = await _db.collection("Category").get();
      final list = snapShot.docs
          .map((document) => CategoryModel.fromMap(document))
          .toList();
      return list;
    } catch (e) {
      handleError(e);
      throw 'something wentwring please try again, ';
    }
  }

  Future<void> uploadData(List<CategoryModel> cagegories) async {
    try {
      final storge = Get.put(EFirebaseStorgeServices());

      for (var category in cagegories) {
        final file = await storge.getImageDataFromAssets(category.Image);

        final url =
            await storge.uploadImageData('Category', file, category.name);

        category.Image = url;

        await _db.collection("Category").doc(category.id).set(category.toMap());
      }
    } catch (e) {
      handleError(e);
      throw 'something wentwring please try again, ';
    }
  }

  Future<List<BannerModel>> fetchBanner() async {
    try {
      final result =
          await _db.collection("Banner").where('Active', isEqualTo: true).get();

      return result.docs
          .map((documentSnapShot) => BannerModel.fromMap(documentSnapShot))
          .toList();
    } catch (e) {
      handleError(e);
      throw Exception("Something went Wrong while fetching Banner");
    } finally {}
  }

  Future<List<ProductModel>> getProudct() async {
    http.Response response = await http.get(Uri.parse(EndPointHelper.products));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }

  Future<List<String>> getCategory() async {
    String baseUrl = 'https://fakestoreapi.com';

    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }

  Future<List<ProductModel>> getAllCategoryy(String categoryNames) async {
    String baseUrl = 'https://fakestoreapi.com';
    http.Response response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
