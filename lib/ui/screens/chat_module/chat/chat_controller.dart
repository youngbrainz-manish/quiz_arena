import 'dart:async';

import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/models/chat_message.dart';
import 'package:quiz_app/core/services/ably_service.dart';
import 'package:quiz_app/core/services/notification_service.dart';

class ChatController extends GetxController {
  ChatController({required this.currentUserId, required this.chatRoomId});

  final String currentUserId;
  final String chatRoomId;

  final TextEditingController msgController = TextEditingController();
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;

  late ably.RealtimeChannel channel;
  final ScrollController scrollController = ScrollController();
  final RxBool isLoading = true.obs;
  late StreamSubscription<ably.Message> _messageSub;

  @override
  Future<void> onInit() async {
    super.onInit();
    AblyService.init(currentUserId);
    AblyService.realtime.connection.on().listen((state) {
      debugPrint('object route => Ably connection: ${state.current}');
    });

    channel = AblyService.chatChannel(chatRoomId);

    await loadHistory();
    _listenMessages();
  }

  // ---------------- HISTORY ----------------
  Future<void> loadHistory() async {
    isLoading.value = true;

    final result = await channel.history(ably.RealtimeHistoryParams(limit: 50));

    final historyMessages = result.items
        .where((m) => m.name == 'message')
        .map((m) => ChatMessage.fromMap(m.data as Map))
        .toList()
        .reversed
        .toList();
    messages.assignAll(historyMessages);

    isLoading.value = false;
    _scrollToBottom();
  }

  // ---------------- REALTIME ----------------
  void _listenMessages() {
    _messageSub = channel.subscribe(name: 'message').listen((ably.Message msg) {
      final chat = ChatMessage.fromMap(msg.data as Map);
      messages.add(chat);
      final title = chat.senderId;
      final body = chat.text;
      NotificationService.show(title: title, body: body);
      _scrollToBottom();
    });
  }

  // ---------------- SEND ----------------
  void sendMessage() {
    final text = msgController.text.trim();
    if (text.isEmpty) return;

    final msg = ChatMessage(senderId: currentUserId, text: text, time: DateTime.now());

    channel.publish(name: 'message', data: msg.toMap());
    msgController.clear();
  }

  // ---------------- SCROLL ----------------
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    msgController.dispose();
    scrollController.dispose();
    _messageSub.cancel();
    super.onClose();
  }
}
