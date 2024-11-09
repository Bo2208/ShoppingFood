import 'package:shop_ban_hang/controllers/auth_controller.dart';
import 'package:shop_ban_hang/controllers/cart_controller.dart';
import 'package:shop_ban_hang/controllers/location_controller.dart';
import 'package:shop_ban_hang/controllers/popular_product_controller.dart';
import 'package:shop_ban_hang/controllers/recommended_product_controller.dart';
import 'package:shop_ban_hang/controllers/user_controller.dart';
import 'package:shop_ban_hang/data/api/api_client.dart';
import 'package:shop_ban_hang/data/repository/auth_repo.dart';
import 'package:shop_ban_hang/data/repository/cart_repo.dart';
import 'package:shop_ban_hang/data/repository/location_repo.dart';
import 'package:shop_ban_hang/data/repository/popular_product_repo.dart';

import 'package:get/get.dart';
import 'package:shop_ban_hang/data/repository/recommended_product_repo.dart';
import 'package:shop_ban_hang/data/repository/user_repo.dart';
import 'package:shop_ban_hang/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  // api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
