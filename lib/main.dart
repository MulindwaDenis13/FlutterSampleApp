import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_product_controller.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'helper/dependencies.dart' as dependencies;
// import 'dart:io' show Platform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp(const FoodDelivery());
}

class FoodDelivery extends StatelessWidget {
  const FoodDelivery({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Food Delivery',
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,
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
// https://github.com/dastagir-ahmed/flutter-ecommerce-app-food-delivery

//google key
// AIzaSyCZWlhsSJ-HlvyUGfuGlfesuiCZzivly90
// AIzaSyD7lVfN-6lJDybbpJpAAmbS0_nhlYiAyMo
// AIzaSyDjHSDTbzDMdMba04MgSMb5dfmwVsh2gII
// AIzaSyDLcwxUggpPZo8lcbH0TB4Crq5SJjtj4ag

// xcode
// https://xcodereleases.com/

//play service
// https://sourceforge.net/projects/opengapps/files/x86_64/20220503/open_gapps-x86_64-9.0-stock-20220503.zip/download?use_mirror=master&r=&use_mirror=autoselect

//installation
// Open a new terminal window
// Type: git clone -b beta https://github.com/flutter/flutter.git
// Wait for the SDK to clone onto your machine
// Type: export PATH=$PWD/flutter/bin:$PATH , which adds flutter tool to your path
// Type: flutter doctor , which downloads additional dependencies
// Wait for dependencies to download and install
