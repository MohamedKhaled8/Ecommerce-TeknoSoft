// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/core/Router/routes.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ecommerce/core/utils/device/e_local_size.dart';
// import '../../../../core/utils/widgets/custom_text_local.dart';
// import 'package:ecommerce/core/utils/constant/color_manger.dart';
// import 'package:ecommerce/core/utils/helper/e-hepler_function.dart';
// import 'package:ecommerce/feature/home/data/model/product_model.dart';
// import 'package:ecommerce/feature/cart/controller/cart_controller.dart';
// import 'package:ecommerce/feature/home/controller/home_controller.dart';
// import 'package:ecommerce/feature/product_screen/ui/product_screen.dart';

// class ECustomHomeCategories extends StatelessWidget {
//   const ECustomHomeCategories({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final HomeControllerImp _controller = Get.find<HomeControllerImp>();
//     return SizedBox(
//       height: 60.h,
//       width: double.infinity,
//       child: ListView.separated(
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return GetBuilder<HomeControllerImp>(builder: (_) {
//               if (_controller.isCatgeoryLoading) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 return InkWell(
//                   onTap: () {
//                     _controller.getCategoryIndex(index);
//                     Get.to(() => CategoryItems(
//                           catehoryTitle: _controller.categoryNameList[index],
//                         ));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: EHelperFunction.isDarkMode(context)
//                           ? ColorsManger.white
//                           : ColorsManger.black,
//                     ),
//                     child: Image.asset("assets/images/png/google.png"),
//                   ),
//                 );
//               }
//             });
//           },
//           separatorBuilder: (_, __) {
//             return SizedBox(
//               width: ELocalSize.defaultSpace.w,
//             );
//           },
//           itemCount: _controller.categoryNameList.length),
//     );
//   }
// }

// class CategoryItems extends StatelessWidget {
//   final String catehoryTitle;
//   const CategoryItems({
//     required this.catehoryTitle,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final HomeControllerImp _controller = Get.find<HomeControllerImp>();

//     return Scaffold(
//         backgroundColor: context.theme.backgroundColor,
//         appBar: AppBar(
//           title: Text(catehoryTitle),
//           centerTitle: true,
//           backgroundColor: EHelperFunction.isDarkMode(context)
//               ? ColorsManger.gray
//               : ColorsManger.primary,
//         ),
//         body: GetBuilder<HomeControllerImp>(
//           builder: (controller) {
//             if (_controller.isAllCategory) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: EHelperFunction.isDarkMode(context)
//                       ? ColorsManger.orange
//                       : ColorsManger.primary,
//                 ),
//               );
//             } else {
//               return GridView.builder(
//                 itemCount: _controller.categoryList.length,
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                   childAspectRatio: 0.8,
//                   mainAxisSpacing: 9.0,
//                   crossAxisSpacing: 6.0,
//                   maxCrossAxisExtent: 200,
//                 ),
//                 itemBuilder: (context, index) {
//                   return buildCardItems(
//                     image: _controller.categoryList[index].image,
//                     price: _controller.categoryList[index].price,
//                     rate: _controller.categoryList[index].rating.rate,
//                     productId: _controller.categoryList[index].id,
//                     productModels: _controller.categoryList[index],
//                     onTap: () {
//                       Get.to(() => ProductDetailsScreen(
//                             productModels: _controller.categoryList[index],
//                           ));
//                     },
//                     context: context,
//                   );
//                 },
//               );
//             }
//           },
//         ));
//   }

//   Widget buildCardItems({
//     required BuildContext context,
//     required String image,
//     required double price,
//     required double rate,
//     required int productId,
//     required ProductModel productModels,
//     required Function()? onTap,
//   }) {
//     final HomeControllerImp _controller = Get.find<HomeControllerImp>();
//     final CartControllerImp _controllerCart = Get.find<CartControllerImp>();

//     return Padding(
//       padding: const EdgeInsets.all(5),
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 3.0,
//                 blurRadius: 5.0,
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Obx(
//                 () => Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         _controller.mangeFavorite(productId);
//                       },
//                       icon: _controller.isFavoriteId(productId)
//                           ? const Icon(
//                               Icons.favorite,
//                               color: Colors.red,
//                             )
//                           : const Icon(
//                               Icons.favorite_outline,
//                               color: Colors.black,
//                             ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         _controllerCart.addProductToCard(productModels);
//                       },
//                       icon: const Icon(
//                         Icons.shopping_cart,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 140,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Image.network(
//                   image,
//                   fit: BoxFit.fitHeight,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "\$ $price",
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Container(
//                       height: 20,
//                       width: 45,
//                       decoration: BoxDecoration(
//                         color: EHelperFunction.isDarkMode(context)
//                             ? ColorsManger.gray
//                             : ColorsManger.primary,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 3, right: 2),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomTextLocal(
//                                 text: "$rate",
//                                 color: Colors.white,
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.normal),
//                             Icon(
//                               Icons.star,
//                               size: 13.h,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
