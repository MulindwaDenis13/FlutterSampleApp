import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo extends GetxService {
  final ApiClient apiClient;

  UserRepo({
    required this.apiClient,
  });

  Future<Response> getUserInfo() async {
    return apiClient.getData(AppConstants.GET_USER_INFO);
  }
  
}
