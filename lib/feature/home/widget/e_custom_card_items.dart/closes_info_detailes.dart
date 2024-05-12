import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_local.dart';
import 'package:ecommerce/feature/home/data/model/product_model.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/favorite_screen/controller/favorite_controller.dart';

class ClosesInfoDetailes extends StatelessWidget {
  final String title;
  final int producteListId;
  final double rate;
  final String descripthion;
  final ProductModel productModels;

  const ClosesInfoDetailes({
    Key? key,
    required this.title,
    required this.producteListId,
    required this.rate,
    required this.descripthion,
    required this.productModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();
    final FavoriteControllerImp _controllerFav =
        Get.find<FavoriteControllerImp>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextLocal(
                  overflow: TextOverflow.ellipsis,
                  text: title,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              GetBuilder<FavoriteControllerImp>(builder: (_) {
                return Container(
                  padding: const EdgeInsets.all(8).r,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      _controllerFav.mangeFavorite(producteListId);
                    },
                    child: _controllerFav.isFavoriteId(producteListId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20.h,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20.h,
                          ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text("${productModels.rating.rate}"),
              RatingBar.builder(
                initialRating: productModels.rating.rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25.h,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _controller.rating = rating;
                },
              ),
            ],
          ),
          GetBuilder<HomeControllerImp>(builder: (controller) {
            return Column(
              children: [
                CustomTextLocal(
                  // ignore: unnecessary_string_interpolations
                  text: "${productModels.description}",
                  maxLines: controller.isShowMore ? 2 : null,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 5.h,
                ),
                TextButton(
                  onPressed: () {
                    controller.isShowMoreText();
                  },
                  child: CustomTextLocal(
                    text: controller.isShowMore ? "Show More" : "Show Less",
                    color: ColorsManger.blue,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
