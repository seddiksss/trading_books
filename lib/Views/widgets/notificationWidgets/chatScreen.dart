import 'package:flutter/material.dart';
import 'package:trading_books/Controllers/chatController.dart';
import 'package:trading_books/Models/message.dart';

class ChatScreen extends StatefulWidget {
  final String currentUserId;
  final String otherUserId;

  const ChatScreen({
    Key? key,
    required this.currentUserId,
    required this.otherUserId,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ChatController _chatService = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: _chatService.getMessages(
                widget.currentUserId,
                widget.otherUserId,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMyMessage =
                        message.senderId == widget.currentUserId;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: Row(
                        mainAxisAlignment: isMyMessage
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  isMyMessage ? Colors.blue : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              message.content,
                              style: TextStyle(
                                color:
                                    isMyMessage ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.trim().isNotEmpty) {
                      final message = Message(
                        senderId: widget.currentUserId,
                        receiverId: widget.otherUserId,
                        content: _messageController.text.trim(),
                        timestamp: DateTime.now(),
                      );
                      _chatService.sendMessage(message);
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
