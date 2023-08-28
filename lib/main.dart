import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_product_controller.dart';
import 'package:ecommerce/pages/cart/cart_page.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dependencies;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp(const FoodDelivery());
}

class FoodDelivery extends StatelessWidget {
  const FoodDelivery({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      home: CartPage(),
      // initialRoute: RouteHelper.initial,
      // getPages: RouteHelper.routes,
    );
  }
}

// https://javiercbk.github.io/json_to_dart/
// https://www.dbestech.com/tutorials/flutter-food-delivery-e-commerce-app-documentation#id_3
// https://api.flutter.dev/flutter/material/Colors-class.html#constants
// flutter downgrade <version> (example: flutter downgrade v1.2.1)
// flutter channel <branch> (example: flutter channel stable)

//installation
// Open a new terminal window
// Type: git clone -b beta https://github.com/flutter/flutter.git
// Wait for the SDK to clone onto your machine
// Type: export PATH=$PWD/flutter/bin:$PATH , which adds flutter tool to your path
// Type: flutter doctor , which downloads additional dependencies
// Wait for dependencies to download and install