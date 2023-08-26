// import 'dart:io' show Platform;

class AppConstants {
  // static String BASE_URL = Platform.isAndroid
  //     ? "http://mvs.bslmeiyu.com"
  //     : "https://mvs.bslmeiyu.com";
  //use host to run local app
  static String BASE_URL = "http://192.168.0.124:8000";
  static const String UPLOAD_URL = "/uploads/";

  static const String APP_NAME = "MDFood";
  static const double APP_VERSION = 1.0;
  static const String APP_TOKEN = "MDToken";

  static const String POPULAR_PRODUCT_URL = "/api/v1/products/popular";
  static const String DRINKS_URL = "/api/v1/products/drinks";
  static const String RECOMMENDED_PRODUCT_URL = "/api/v1/products/recommended";
  static const String LOGIN_URL = "/api/v1/auth/login";
  static const String REGISTRATION_URL = "/api/v1/auth/register";


  static const String CART_LIST = 'cart-list';

  static const String PHONE = '';
  static const String PASSWORD= '';
  static const String CART_HISTORY = 'cart-history';
}
