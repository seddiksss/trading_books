import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String content;
  final Timestamp timestamp;

  MessageModel({
    required this.senderEmail,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'content': content,
      'timestamp': timestamp,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
        senderId: map['senderId'],
        senderEmail: map['senderEmail'],
        receiverId: map['receiverId'],
        content: map['content'],
        timestamp: map['timestamp']);
  }
}
