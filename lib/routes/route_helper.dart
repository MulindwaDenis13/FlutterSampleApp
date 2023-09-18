import 'package:ecommerce/pages/address/add_address.dart';
import 'package:ecommerce/pages/auth/sign_in_page.dart';
import 'package:ecommerce/pages/auth/sign_up_page.dart';
import 'package:ecommerce/pages/cart/cart_page.dart';
import 'package:ecommerce/pages/food/popular_food_detail.dart';
import 'package:ecommerce/pages/food/recommended_food_detail.dart';
import 'package:ecommerce/pages/home/home_page.dart';
import 'package:ecommerce/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String splashPage = '/splash-page';
  static const String signInPage = '/sign-in-page';
  static const String signUpPage = '/sign-up-page';
  static const String addressPage = '/address-page';

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSplashPage() => '$splashPage';
  static String getSignInPage() => '$signInPage';
  static String getSignUpPage() => '$signUpPage';
  static String getAddressPage() => '$addressPage';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetails(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () => const CartPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: signInPage,
      page: () => const SignInPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signUpPage,
      page: () => const SignUpPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: addressPage,
      page: () => const AddAddressPage(),
      transition: Transition.fadeIn,
    )
  ];
}
