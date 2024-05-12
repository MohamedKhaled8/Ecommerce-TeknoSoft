import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/language_screen/data/model/choose_lang_model.dart';
import 'package:ecommerce/core/utils/services/localization_services/local_sevices.dart';

abstract class LocalController extends GetxController {
  changeLanguage(String langCode);
}

class LocalControllerImp extends LocalController {
  Locale? language;
  int value = 1;
  int languageIndex = 0;

   selectValue(int index) {
    languageIndex = index; 
    update();
  }

  MyServices myServices = Get.find<MyServices>();

  @override
  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreference.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? shardPrefLang = myServices.sharedPreference.getString("lang");

    switch (shardPrefLang) {
      case 'ar':
        language = const Locale('ar');
        break;
      case 'en':
        language = const Locale('en');
        break;
      default:
        language = Locale(Get.deviceLocale!.languageCode);
        break;
    }
     if (shardPrefLang != null) {
      int index = chooseLangModel.indexWhere((element) => element.code == shardPrefLang);
      if (index != -1) {
        languageIndex = index;
      }
    }
    super.onInit();
  }
  
}
