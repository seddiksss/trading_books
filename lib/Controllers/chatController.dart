import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trading_books/Models/message.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(Message message) async {
    // Create a unique chat room ID using sorted user IDs
    final List<String> ids = [message.senderId, message.receiverId]..sort();
    final String chatRoomId = ids.join('_');

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(message.toMap());
  }

  Stream<List<Message>> getMessages(String userId1, String userId2) {
    // Create chat room ID using sorted user IDs
    final List<String> ids = [userId1, userId2]..sort();
    final String chatRoomId = ids.join('_');

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList();
    });
  }
}
