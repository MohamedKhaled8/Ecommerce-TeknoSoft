import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/feature/maps/ui/maps_screen.dart';
import 'package:ecommerce/feature/cart/ui/cart_screen.dart';
import 'package:ecommerce/feature/home/ui/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ecommerce/feature/setting/ui/profile_screen.dart';
import 'package:ecommerce/feature/setting/ui/setting_screen.dart';
import 'package:ecommerce/feature/auth/login/ui/login_screen.dart';
import 'package:ecommerce/feature/setting/ui/change_name_screen.dart';
import 'package:ecommerce/feature/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:ecommerce/feature/setting/ui/user_address_screen.dart';
import 'package:ecommerce/feature/auth/verify_code/ui/verifyscreen.dart';
import 'package:ecommerce/feature/auth/register/ui/register_screen.dart';
import 'package:ecommerce/feature/setting/ui/add_new_address_screen.dart';
import 'package:ecommerce/feature/language_screen/ui/language_screen.dart';
import 'package:ecommerce/feature/category/ui/sub_categoryies_screen.dart';
import 'package:ecommerce/feature/favorite_screen/ui/favorite_screen.dart';
import 'package:ecommerce/feature/auth/forget_password/ui/forget_password.dart';
import 'package:ecommerce/feature/on_bardingscreen.dart/ui/on_bording_screen.dart';

final _auth = FirebaseAuth.instance;

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const OnBardingScreen(),
    // middlewares: [MyMiddleWare()],
  ),
  // GetPage(
  //   name: AppRoute.onBoarding,
  //   page: () => const OnBardingScreen(),
  // ),
  GetPage(
    name: AppRoute.loginScreen,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoute.registerScreen,
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name: AppRoute.verifyEmail,
    page: () => VerifyEmailScreen(
      email: _auth.currentUser?.email,
    ),
  ),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoute.buttonBavBar,
    page: () => const ButtonNavBar(),
  ),
  GetPage(
    name: AppRoute.homeScreen,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoute.favoriteScreen,
    page: () => const FavoriteScreen(),
  ),
  GetPage(
    name: AppRoute.userAddressScreen,
    page: () => const UserAddressScreen(),
  ),
  GetPage(
    name: AppRoute.settingScreen,
    page: () => const SettingScreen(),
  ),
  GetPage(
    name: AppRoute.addNewAddressScreen,
    page: () => const AddNewAddressScreen(),
  ),
  GetPage(
    name: AppRoute.profileScreen,
    page: () => const ProfileScreen(),
  ),

  GetPage(
    name: AppRoute.cartScreen,
    page: () => const CartScreen(),
  ),

  GetPage(
    name: AppRoute.subCategoriesScreen,
    page: () => const CategoryScreen(),
  ),

  GetPage(
    name: AppRoute.changeName,
    page: () => const ChangeNameScreen(),
  ),
  GetPage(
    name: AppRoute.googleMaps,
    page: () => const GoogleMapScreen(),
  ),
  GetPage(
    name: AppRoute.languageScreen,
    page: () => const LanguageScreen(),
  ),
];
