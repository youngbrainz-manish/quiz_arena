import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/models/user_model.dart';
import 'package:quiz_app/core/services/ably_service.dart';
import 'package:quiz_app/ui/screens/chat_module/users/users_controller.dart';
import 'package:quiz_app/ui/widgets/common_buttons.dart';
import 'package:quiz_app/ui/widgets/common_widget.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UsersController usersController = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List", style: TextStyle().copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: GetBuilder(
          builder: (UsersController usersController) {
            return _buildBody(context: context, usersController: usersController);
          },
        ),
      ),
    );
  }

  Widget _buildBody({required BuildContext context, required UsersController usersController}) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(),
      child: usersController.isLoading == true
          ? CommonWidget().defaultLoader()
          : Column(
              children: [
                SizedBox(height: 12),

                GetBuilder<UsersController>(
                  builder: (controller) {
                    return CommonButtons().textButton(
                      width: 200,
                      title: controller.currentUserModel != null
                          ? "Continue As ${controller.currentUserModel!.name}"
                          : "Select Yourself",
                      onTap: () async {
                        await usersController.selectUser();
                      },
                    );
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    itemCount: usersController.userList.length,
                    itemBuilder: (context, index) {
                      UserModel userModel = usersController.userList[index];
                      if (userModel.id == usersController.currentUserModel?.id) {
                        return SizedBox();
                      }
                      return GestureDetector(
                        onTap: () async {
                          if (usersController.currentUserModel == null) {
                            CommonWidget().showMessageDialog(
                              message: 'Select Who you are and them message someone!',
                              title: 'Choose Yourself first',
                            );
                          } else {
                            final roomId = AblyService.privateRoomId(
                              userA: usersController.currentUserModel?.id ?? 1,
                              userB: userModel.id,
                            );
                            Get.toNamed(
                              "chatScreenRoute",
                              arguments: {
                                "myId": usersController.currentUserModel?.id ?? 1,
                                "chatRoomId": roomId,
                                "userName": userModel.name,
                              },
                            );
                          }
                        },
                        child: Card(
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 8, right: 8),
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                              child: Text(
                                "${userModel.id}",
                                style: TextStyle().copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                            title: Text(
                              userModel.name,
                              style: TextStyle().copyWith(fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(userModel.mobile, style: TextStyle().copyWith(fontSize: 11)),
                            trailing: Icon(Icons.message),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
