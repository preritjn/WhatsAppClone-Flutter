import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Model/ChatModel.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key,required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[500],
                  child: SvgPicture.asset(
                    'assets/person.svg',
                    color: Colors.white70,
                    height: 38.0,
                    width: 38.0,
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 15,),
                  ),
                )
              ]
          ),
          const SizedBox(height: 2),
          Text(
            chatModel.name,
            style: const TextStyle(
                fontSize: 12),
          )
        ],
      ),
    );
  }
}