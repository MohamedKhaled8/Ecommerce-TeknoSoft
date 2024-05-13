import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/app_router.dart';
import 'package:ecommerce/core/utils/themes/e_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/localization/lang.dart';
import 'package:ecommerce/core/utils/localization/change_local.dart';


class EcommerceStore extends StatelessWidget {
  const EcommerceStore({super.key});

  @override
  Widget build(BuildContext context) {
    LocalControllerImp localController =
        Get.put<LocalControllerImp>(LocalControllerImp());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: AppTranslation(),
          locale: localController.language,
          debugShowCheckedModeBanner: false,
          title: 'E-commerce',
          themeMode: ThemeMode.system,
          theme: EAppTheme.ligthTheme,
          darkTheme: EAppTheme.darkTheme,
          getPages: routes,
        );
      },
    );
  }
}
