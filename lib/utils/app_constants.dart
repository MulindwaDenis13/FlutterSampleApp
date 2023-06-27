import 'dart:io' show Platform;

class AppConstants {
  static String BASE_URL = Platform.isAndroid
      ? "http://mvs.bslmeiyu.com"
      : "https://mvs.bslmeiyu.com";
  static const String APP_NAME = "MDFood";
  static const double APP_VERSION = 1.0;
  static const String APP_TOKEN = "MDToken";
  static const String POPULAR_PRODUCT_URL = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URL = "/api/v1/products/recommended";
  static const String UPLOAD_URL = "/uploads/";
}
