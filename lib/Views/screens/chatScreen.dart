import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/chatController.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';

class ChatScreen extends StatelessWidget {
  final String recieverEmail;
  final String recieverUserID;
  ChatController chatController = Get.find();
  String time = "xxx";

  ChatScreen(
      {super.key, required this.recieverEmail, required this.recieverUserID});

  @override
  Widget build(BuildContext context) {
    String time = "xxx";
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(recieverEmail)),
      ),
      // bottomSheet: Row(
      //   children: [
      //     Expanded(
      //         // width: 300,
      //         child: TextFormField(
      //             decoration: InputDecoration(
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //             ),
      //             controller: chatController.message)),
      //     IconButton(
      //         onPressed: () async {
      //           if (chatController.message.text.isNotEmpty) {
      //             await chatController.sendMessage(
      //                 recieverUserID, chatController.message.text);
      //             chatController.message.clear();
      //             time = chatController.timeNow.hour.toString();
      //             print("....time:::${time}");
      //           }
      //         },
      //         icon: const Icon(Icons.send))
      //   ],
      // ),
      body: _buildMessagList(time),
    );
  }

  Widget _buildMessagList(String time) {
    return StreamBuilder(
        stream: chatController.getMessages(
            chatController.auth.currentUser!.uid, recieverUserID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (conext, index) {
                      // return Text(snapshot.data![index]['email'].toString());
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        child: Row(
                          mainAxisAlignment: recieverUserID ==
                                  snapshot.data!.docs[index]['senderId']
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: AppColor.thirdColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]['content']
                                            .toString(),
                                        style: const TextStyle(
                                            color: AppColor.white),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        chatController.formatTimestamp(snapshot
                                            .data!.docs[index]['timestamp']),
                                        style: const TextStyle(
                                            color: AppColor.white),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      );
                    }),
              ),
              _textFormFiledsender()
            ],
          );
        });
  }

  Widget _textFormFiledsender() {
    return Row(
      children: [
        Expanded(
            // width: 300,
            child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: chatController.message)),
        IconButton(
            onPressed: () async {
              time = DateTime.now().toString();
              chatController.update();
              print("....time:::${time}");
              if (chatController.message.text.isNotEmpty) {
                await chatController.sendMessage(
                    recieverUserID, chatController.message.text);
                chatController.message.clear();
              }
            },
            icon: const Icon(Icons.send))
      ],
    );
  }

//   final String currentUserId;
//   final String otherUserId;

//   const ChatScreen({
//     Key? key,
//     required this.currentUserId,
//     required this.otherUserId,
//   }) : super(key: key);

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final ChatController _chatService = ChatController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<List<MessageModel>>(
//               stream: _chatService.getMessages(
//                 widget.currentUserId,
//                 widget.otherUserId,
//               ),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }

//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 final messages = snapshot.data!;

//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final message = messages[index];
//                     final isMyMessage =
//                         message.senderId == widget.currentUserId;

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8.0,
//                         vertical: 4.0,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: isMyMessage
//                             ? MainAxisAlignment.end
//                             : MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             constraints: BoxConstraints(
//                               maxWidth: MediaQuery.of(context).size.width * 0.7,
//                             ),
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color:
//                                   isMyMessage ? Colors.blue : Colors.grey[300],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Text(
//                               message.content,
//                               style: TextStyle(
//                                 color:
//                                     isMyMessage ? Colors.white : Colors.black,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: const InputDecoration(
//                       hintText: 'Type a message',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {
//                     if (_messageController.text.trim().isNotEmpty) {
//                       final message = MessageModel(
//                         senderId: widget.currentUserId,
//                         receiverId: widget.otherUserId,
//                         content: _messageController.text.trim(),
//                         timestamp: DateTime.now(),
//                       );
//                       _chatService.sendMessage(message);
//                       _messageController.clear();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}
