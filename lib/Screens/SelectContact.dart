import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/ButtonCard.dart';
import 'package:whatsapp_clone/CustomUI/ContactCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {

  List<ChatModel> contacts = [
    ChatModel(name: '7008205939(You)', status: 'Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Prerit Kumar Jain', status: 'Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Prerit Agrawal', status: 'Web and Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Ashutosh Behuria', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Soham Dash', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Jitu Tayal', status: '2 star Coder', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Anurag Prasad', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Anshu Agrawal', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: '7008205939(You)', status: 'Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Prerit Kumar Jain', status: 'Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Prerit Agrawal', status: 'Web and Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Ashutosh Behuria', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Soham Dash', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Jitu Tayal', status: '2 star Coder', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Anurag Prasad', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Anshu Agrawal', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text('Select Contact',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23
              ),),
            Text('1000 contacts',
              style: TextStyle(
                fontSize: 16
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(value: 'Invite a friend', child: Text('Invite a friend')),
              const PopupMenuItem(value: 'Contacts', child: Text('Contacts')),
              const PopupMenuItem(value: 'Refresh', child: Text('Refresh')),
              const PopupMenuItem(value: 'Help', child: Text('Help')),
            ];
          })
        ],
      ),
      body:ListView.builder(
        itemCount: contacts.length+3,
        itemBuilder: (context,index) {
          if(index == 0) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder)=> const CreateGroup()));
                },
                child: const ButtonCard(name: 'New group', icon: Icons.group));
          }
          else if(index == 1) {
            return InkWell(
                onTap: () {},
                child: const ButtonCard(name: 'New Contact', icon: Icons.person_add));
          }
          else if(index == 2) {
            return InkWell(
                onTap: () {},
                child: const ButtonCard(name: 'New community', icon: Icons.groups_rounded));
          }
          else {
            return InkWell(
                onTap: () {},
                child: ContactCard(chatModel: contacts[index-3]));
          }
        }
      ),
    );
  }
}