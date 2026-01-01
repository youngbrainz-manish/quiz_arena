import 'package:ably_flutter/ably_flutter.dart' as ably;

class AblyService {
  static late ably.Realtime realtime;

  static void init(String userId) {
    realtime = ably.Realtime(
      options: ably.ClientOptions(
        key: '-uD7Ng.WlWKBA:dsMLhVYh48KISB0NiHZYbGsLFCykPQ4EhM4dhOpj9Xw', // ignore for now
        clientId: userId,
      ),
    );
  }

  /// Generic chat channel (1–1 or group)
  static ably.RealtimeChannel chatChannel(String chatRoomId) {
    return realtime.channels.get('chat-$chatRoomId');
  }

  /// Helper for 1–1 private chat
  static String privateRoomId({required int userA, required int userB}) {
    final users = [userA, userB]..sort();
    return '${users[0]}-${users[1]}';
  }
}
