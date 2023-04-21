import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/SelectContact.dart';
import '../CustomUI/CustomCard.dart';
import '../Model/ChatModel.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key,required this.chatModels,required this.sourceChat}) : super(key: key);

  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => const SelectContact()));
          },
          child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: widget.chatModels.length,
          itemBuilder: (context,index) => CustomCard(chatModel: widget.chatModels[index],sourceChat: widget.sourceChat)
      ),
    );
  }
}