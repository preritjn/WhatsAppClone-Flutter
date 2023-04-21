import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key,required this.chatModel,required this.sourceChat}) : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IndividualPage(chatModel: chatModel,sourceChat: sourceChat)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[500],
              child: SvgPicture.asset(
                chatModel.isGroup? 'assets/groups.svg':'assets/person.svg',
                color: Colors.white70,
                height: 38.0,
                width: 38.0,
              ),
            ),
            title: Text(
              chatModel.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(width: 3.0),
                Text(
                  chatModel.currentMessage,
                  style: const TextStyle(
                      fontSize: 14.0),
                )
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          const SizedBox(height: 1.0)
        ],
      ),
    );
  }
}