import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/constant/image_assets.dart';

class ChooseLangMode {
  final String nameLang;
  final String image;
  final List<VoidCallback> onTap;
  final String code;

  ChooseLangMode({
    required this.nameLang,
    required this.image,
    required this.onTap,
    required this.code, // Initialize code property
  });
}

List<ChooseLangMode> chooseLangModel = [
  ChooseLangMode(
      nameLang: "English",
      image: AppImageAsset.english,
      onTap: [],
      code: "en"), // English code: "en"
  ChooseLangMode(
      nameLang: "Arabic",
      image: AppImageAsset.arabic,
      onTap: [],
      code: "ar"), // Arabic code: "ar"
  ChooseLangMode(
      nameLang: "French",
      image: AppImageAsset.french,
      onTap: [],
      code: "fr"), // French code: "fr"
];
