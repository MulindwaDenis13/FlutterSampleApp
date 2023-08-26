import 'package:ecommerce/data/repositories/auth_repo.dart';
import 'package:ecommerce/models/response_model.dart';
import 'package:ecommerce/models/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await authRepo.registration(signUpBody);
    if (response.statusCode == 200) {
      authRepo.saveUserAuthToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await authRepo.login(email, password);
    if (response.statusCode == 200) {
      authRepo.saveUserAuthToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }
}
