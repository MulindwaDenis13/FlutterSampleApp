import 'package:ecommerce/data/repositories/user_repo.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:get/get.dart';
import 'package:ecommerce/models/response_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = false;
  late User _user;

  bool get isLoading => _isLoading;
  User get user => _user;

  Future<ResponseModel> getUserInfo() async {
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await userRepo.getUserInfo();
    if (response.statusCode == 200) {
      _user = User.fromJson(response.body);
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
