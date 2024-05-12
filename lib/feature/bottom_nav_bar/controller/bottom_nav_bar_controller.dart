import 'package:get/get.dart';
import '../../home/ui/home_screen.dart';
import 'package:ecommerce/feature/setting/ui/setting_screen.dart';
import 'package:ecommerce/feature/category/ui/sub_categoryies_screen.dart';
import 'package:ecommerce/feature/favorite_screen/ui/favorite_screen.dart';

abstract class BottomNavBarController extends GetxController {}

class BottomNavBarItem extends BottomNavBarController {
  int selectedIndex = 0;
  final screen = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
  ];
}
