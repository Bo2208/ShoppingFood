import 'package:get/get.dart';
import 'package:shop_ban_hang/data/repository/user_repo.dart';
import 'package:shop_ban_hang/models/response_model.dart';
import 'package:shop_ban_hang/models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late UserModel _userModel; //Cho phép null để tránh lỗi khởi tạo muộn
  UserModel get userModel => _userModel;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getUserInfo(); // Gọi getUserInfo khi khởi tạo controller
  // }

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }
}
