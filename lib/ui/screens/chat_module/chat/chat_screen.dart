import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/ui/screens/chat_module/chat/chat_controller.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  int? currentUserId = Get.arguments['myId'];
  String? chatRoomId = Get.arguments['chatRoomId'];
  String? userName = Get.arguments['userName'];

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(
      ChatController(currentUserId: "${currentUserId ?? '0'}", chatRoomId: chatRoomId ?? '0'),
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Chatting with $userName")),
        body: SafeArea(child: _buildBody(chatController: chatController)),
      ),
    );
  }

  Widget _buildBody({required ChatController chatController}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                controller: chatController.scrollController,
                itemCount: chatController.messages.length,
                itemBuilder: (_, i) {
                  final m = chatController.messages[i];
                  final isMe = m.senderId == chatController.currentUserId;

                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(m.text, style: TextStyle(color: isMe ? Colors.white : Colors.black)),
                    ),
                  );
                },
              );
            }),
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: chatController.msgController,
                    decoration: const InputDecoration(
                      hintText: 'Type message',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, size: 28, color: Colors.red),
                onPressed: chatController.sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
