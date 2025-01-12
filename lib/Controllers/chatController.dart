import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Models/messageModel.dart';

class ChatController extends GetxController {
  TextEditingController message = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference user =
      FirebaseFirestore.instance.collection("Users");

  Future<void> sendMessage(String receiverId, message) async {
    final String currentUserID = auth.currentUser!.uid;
    final String currerntUserEmail = auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    MessageModel? newmessage = MessageModel(
        senderEmail: currerntUserEmail,
        senderId: currentUserID,
        receiverId: receiverId,
        content: message,
        timestamp: timestamp);
    List ids = [currentUserID, receiverId];
    ids.sort();
    String chatRoomID = ids.join('_');
    await firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection('messages')
        .add(newmessage.toMap());
  }

  Stream<QuerySnapshot>? getMessages(String userID, otherUserID) {
    List ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  String formatTimestamp(Timestamp timestamp) {
    if (timestamp == null) return '';

    DateTime dateTime = timestamp.toDate();
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
///////////////////////////////////////////////////////
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<void> sendMessage(MessageModel message) async {
  //   // Create a unique chat room ID using sorted user IDs
  //   final List<String> ids = [message.senderId, message.receiverId]..sort();
  //   final String chatRoomId = ids.join('_');

  //   await _firestore
  //       .collection('chat_rooms')
  //       .doc(chatRoomId)
  //       .collection('messages')
  //       .add(message.toMap());
  // }

  // Stream<List<MessageModel>> getMessages(String userId1, String userId2) {
  //   // Create chat room ID using sorted user IDs
  //   final List<String> ids = [userId1, userId2]..sort();
  //   final String chatRoomId = ids.join('_');

  //   return _firestore
  //       .collection('chat_rooms')
  //       .doc(chatRoomId)
  //       .collection('messages')
  //       .orderBy('timestamp', descending: true)
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs
  //         .map((doc) => MessageModel.fromMap(doc.data()))
  //         .toList();
  //   });
  // }
}
