import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
   String Image;
  final String parentld;
  final bool isFeatured;
  CategoryModel({
    required this.id,
    required this.name,
    required this.Image,
    this.parentld = '',
    required this.isFeatured,
  });

  static CategoryModel empty() => CategoryModel(
      id: "", name: "", parentld: "", isFeatured: false, Image: '');

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'Name': name,
      'parentld': parentld,
      'isFeatured': isFeatured,
      'Image': Image,
    };
  }

  factory CategoryModel.fromMap(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return CategoryModel(
        id: document.id,
        name: data['name'] ?? '',
        parentld: data['parentld'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
        Image: data['Image'] ?? '',
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
