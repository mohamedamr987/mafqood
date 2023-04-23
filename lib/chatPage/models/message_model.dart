import '../../core/core_info.dart';

class MessageModel {
  final String message;
  final String sender;
  final DateTime time;
  bool get isMe => sender == CoreInfo.auth.currentUser!.uid;

  MessageModel({
    required this.message,
    required this.sender,
    required this.time,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      sender: json['from'],
      time: DateTime.fromMillisecondsSinceEpoch(json['time']),
    );
  }

  factory MessageModel.fromMe(String message) {
    return MessageModel(
      message: message,
      sender: CoreInfo.auth.currentUser!.uid,
      time: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'from': sender,
      'time': time,
    };
  }

}