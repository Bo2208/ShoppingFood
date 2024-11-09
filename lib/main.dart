import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ban_hang/controllers/cart_controller.dart';
import 'package:shop_ban_hang/controllers/popular_product_controller.dart';
import 'package:shop_ban_hang/controllers/recommended_product_controller.dart';
import 'package:shop_ban_hang/pages/auth/sign_in_page.dart';
import 'package:shop_ban_hang/pages/auth/sign_up_page.dart';
import 'package:shop_ban_hang/pages/food/popular_food_detail.dart';
import 'package:shop_ban_hang/pages/food/recommended_food_detail.dart';
import 'package:shop_ban_hang/pages/home/main_food_page.dart';
import 'package:shop_ban_hang/pages/splash/splash_page.dart';
import 'package:shop_ban_hang/routes/route_helper.dart';

import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: SignInPage(),
          // home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
