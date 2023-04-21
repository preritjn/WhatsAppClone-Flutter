import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/ButtonCard.dart';
import 'package:whatsapp_clone/Screens/HomeScreen.dart';
import '../Model/ChatModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late ChatModel sourceChat;
  List<ChatModel> chats = [
    ChatModel(name: 'Prerit Kumar Jain', icon: 'person.svg', time: '6:30PM', currentMessage: 'Hello Everyone', isGroup: false, status: '',id: 1),
    ChatModel(name: 'Prerit Agrawal', icon: 'person.svg', time: '7:30PM', currentMessage: 'Hello Everyone', isGroup: false, status: '',id: 2),
    ChatModel(name: 'Ashutosh Behuria', icon: 'person.svg', time: '8:30PM', currentMessage: 'Hello Everyone', isGroup: false, status: '',id: 3),
    ChatModel(name: 'Anshu Agrawal', icon: 'person.svg', time: '5:30PM', currentMessage: 'Hello Everyone', isGroup: false, status: '',id: 4),
    ChatModel(name: 'Soham Dash', icon: 'person.svg', time: '6:30PM', currentMessage: 'Hello Everyone', isGroup: false, status: '',id: 5),
    ChatModel(name: 'Anurag Thaakur', icon: 'person.svg', time: '6:30PM', currentMessage: 'Hello Everyone', isGroup: false, status: '',id: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
          itemBuilder: (context,index)=> InkWell(
            onTap: () {
              sourceChat = chats.removeAt(index);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>HomeScreen(chatModels: chats,sourceChat: sourceChat)));
            },
            child: ButtonCard(name: chats[index].name, icon: Icons.person
            ),
          )
      ),
    );
  }
}