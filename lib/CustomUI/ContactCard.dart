import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key,required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[500],
              child: SvgPicture.asset(
                'assets/person.svg',
                color: Colors.white70,
                height: 38.0,
                width: 38.0,
              ),
            ),
            chatModel.select? const Positioned(
              bottom: 4,
              right: 1,
              child: CircleAvatar(
                radius: 11,
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,),
              ),
            ): Container()
          ]
        ),
      ),
      title: Text(
        chatModel.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
       ),
      ),
      subtitle: Text(
          chatModel.status,
          style: const TextStyle(
              fontSize: 14.0
          )
      ),
    );
  }
}