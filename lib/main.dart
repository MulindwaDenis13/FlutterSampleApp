import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_product_controller.dart';
import 'package:ecommerce/pages/auth/sign_in_page.dart';
import 'package:ecommerce/pages/auth/sign_up_page.dart';
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
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return const GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Food Delivery',
              // initialRoute: RouteHelper.getSplashPage(),
              // getPages: RouteHelper.routes,
              // home: SignUpPage(),
              home: SignInPage(),
            );
          },
        );
      },
    );
  }
}
//for missing plugin exception clean flutter and clear everything
// https://javiercbk.github.io/json_to_dart/
// https://www.dbestech.com/tutorials/flutter-food-delivery-e-commerce-app-documentation#id_3
// https://api.flutter.dev/flutter/material/Colors-class.html#constants
// flutter downgrade <version> (example: flutter downgrade v1.2.1)
// flutter channel <branch> (example: flutter channel stable)
// pub.dev
//shift + command + k helps to show keyboard on mac