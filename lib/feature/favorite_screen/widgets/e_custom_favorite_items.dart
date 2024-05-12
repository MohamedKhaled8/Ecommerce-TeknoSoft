import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../home/controller/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_local.dart';

class ECustomFavoriteItems extends StatelessWidget {
  final String image;
  final double price;
  final String title;
  final int producteListId;
  const ECustomFavoriteItems({
    Key? key,
    required this.image,
    required this.price,
    required this.title,
    required this.producteListId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();

    return Padding(
      padding: const EdgeInsets.all(10.0).r,
      child: SizedBox(
        height: 80.h,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextLocal(
                      overflow: TextOverflow.ellipsis,
                      text: title,
                      color: EHelperFunction.isDarkMode(context)
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.normal,
                      underLine: TextDecoration.none),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextLocal(
                      text: "\$ $price",
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.normal,
                      underLine: TextDecoration.none),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  _controller.mangeFavorite(producteListId);
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30.h,
                )),
          ],
        ),
      ),
    );
  }
}
