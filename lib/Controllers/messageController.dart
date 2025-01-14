import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Views/screens/chatScreen.dart';

class MessagController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? getCurrentUser() {
    return auth.currentUser;
  }

  goToChatPage(String recieverEmail, recieverUserID) {
    Get.to(() => ChatScreen(
        recieverEmail: recieverEmail, recieverUserID: recieverUserID));
  }

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        print("user......;$user");
        print("data......${snapshot.docs}");
        return user;
      }).toList();
    });
  }

  Stream<QuerySnapshot>? getNotifMessage(String userID, otherUserID) {
    List ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    print("chat Rooooooom ..${chatRoomID}");
    return firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  String formatTimestamp(Timestamp timestamp) {
    if (timestamp == null) return '';

    DateTime dateTime = timestamp.toDate();
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
