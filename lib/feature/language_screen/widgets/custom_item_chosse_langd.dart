import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/themes/e_dash_line_pinter.dart';
import 'package:ecommerce/core/utils/localization/change_local.dart';
import 'package:ecommerce/feature/language_screen/data/model/choose_lang_model.dart';

class CustomItemChooseLang extends GetView<LocalControllerImp> {
  final int index;
  const CustomItemChooseLang({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, String> flagMap = {
      "en": "🇺🇸",
      "ar": "🇸🇦",
      "fr": "🇫🇷",
    };
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: InkWell(
              onTap: () {
                controller.changeLanguage(chooseLangModel[index].code);
              },
              child: Row(children: [
                Expanded(
                  child: RadioListTile(
                    title: Text(chooseLangModel[index].nameLang.tr),
                    activeColor: ColorsManger.green,
                    value: index,
                    groupValue: controller.languageIndex,
                    onChanged: (value) {
                      controller.selectValue(index);
                      controller.changeLanguage(chooseLangModel[index].code);
                    },
                    selected: controller.languageIndex ==
                        index, // تحديد اللغة المختارة فقط
                  ),
                ),
                Text(
                  flagMap[chooseLangModel[index].code]!,
                  style: TextStyle(fontSize: 24.sp),
                ),
              ])),
        ),
        _buildDottedDivider(),
      ],
    );
  }
    Widget _buildDottedDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomPaint(
        painter: DashLinePainter(),
        size: const Size(double.infinity, 1),
      ),
    );
  }

}
