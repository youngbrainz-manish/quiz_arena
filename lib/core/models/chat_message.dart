class ChatMessage {
  final String senderId;
  final String text;
  final DateTime time;

  ChatMessage({required this.senderId, required this.text, required this.time});

  factory ChatMessage.fromMap(Map data) {
    return ChatMessage(senderId: data['senderId'], text: data['text'], time: DateTime.parse(data['time']));
  }

  Map<String, dynamic> toMap() => {'senderId': senderId, 'text': text, 'time': time.toIso8601String()};
}
