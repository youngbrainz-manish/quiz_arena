import 'package:get/get.dart';
import 'package:quiz_app/core/models/user_model.dart';
import 'package:quiz_app/ui/screens/chat_module/users/user_list_dialog.dart';

class UsersController extends GetxController {
  List<UserModel> userList = <UserModel>[];
  UserModel? currentUserModel;
  bool isLoading = true;
  @override
  Future<void> onInit() async {
    getUsersList();
    super.onInit();
  }

  Future<void> selectUser() async {
    final user = await openUserDialog();
    if (user != null) {
      currentUserModel = user;
      update();
    }
  }

  Future<UserModel?> openUserDialog() async {
    return await Get.dialog<UserModel>(UserSelectDialog(users: userList));
  }

  void getUsersList() {
    userList.addAll([
      UserModel(id: 10001, name: "Mehul", mobile: "9999999995"),
      UserModel(id: 10002, name: "Bharat", mobile: "9999999994"),
      UserModel(id: 10003, name: "Mahesh", mobile: "9999999993"),
      UserModel(id: 10004, name: "Manish", mobile: "9999999992"),
      UserModel(id: 10005, name: "Dhruv", mobile: "9999999991"),
      UserModel(id: 10006, name: "Dhaval", mobile: "9999999990"),
      UserModel(id: 10007, name: "Dharmesh", mobile: "9999999910"),
      UserModel(id: 10008, name: "Anirudhdh", mobile: "9999999920"),
      UserModel(id: 10009, name: "Dev", mobile: "9999999930"),
      UserModel(id: 10010, name: "Shahdev", mobile: "9999999940"),
    ]);
    isLoading = false;
    update();
  }
}
