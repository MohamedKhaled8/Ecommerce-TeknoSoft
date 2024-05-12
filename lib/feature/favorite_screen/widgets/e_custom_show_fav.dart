import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/feature/home/controller/home_controller.dart';
import 'package:ecommerce/feature/favorite_screen/widgets/e_custom_favorite_items.dart';

class ECsutomShowFav extends StatelessWidget {
  const ECsutomShowFav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp _controller = Get.find<HomeControllerImp>();

    return ListView.separated(
        itemBuilder: (context, index) {
          return ECustomFavoriteItems(
            image: _controller.favoriteList[index].image,
            price: _controller.favoriteList[index].price,
            title: _controller.favoriteList[index].title,
            producteListId: _controller.favoriteList[index].id,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
            thickness: 1,
          );
        },
        itemCount: _controller.favoriteList.length);
  }
}
