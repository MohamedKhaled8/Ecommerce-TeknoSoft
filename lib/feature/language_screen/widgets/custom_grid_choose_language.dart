import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/feature/language_screen/data/model/choose_lang_model.dart';
import 'package:ecommerce/feature/language_screen/widgets/custom_item_chosse_langd.dart';


class CustomGridChooseLanguage extends StatelessWidget {
  const CustomGridChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chooseLangModel.length,
      itemBuilder: (context, index) {
        return CustomItemChooseLang(index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20.h,
        );
      },
    );
  }
}





