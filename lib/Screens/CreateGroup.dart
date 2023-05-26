import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/AvatarCard.dart';
import '../CustomUI/ContactCard.dart';
import '../Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  List<ChatModel> contacts = [
    ChatModel(name: '7008205939(You)', status: 'Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Prerit Kumar Jain', status: 'Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Prerit Agrawal', status: 'Web and Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Ashutosh Behuria', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Soham Dash', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Jitu Tayal', status: '2 star Coder', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Anurag Prasad', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Anshu Agrawal', status: 'Chutiya Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: '7008205939(You)', status: 'Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Prerit Kumar Jain', status: 'Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Prerit Agrawal', status: 'Web and Android Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Ashutosh Behuria', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Soham Dash', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Jitu Tayal', status: '2 star Coder', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Anurag Prasad', status: 'Frontend Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
    ChatModel(name: 'Anshu Agrawal', status: 'Chutiya Developer', icon: '', time: '', currentMessage: '', isGroup: true,id: 1),
  ];
  List<ChatModel> group = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('New group',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23
              ),),
            Text('Add participants',
              style: TextStyle(
                  fontSize: 16
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body:Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length+1,
              itemBuilder: (context,index) {
                  if(index==0) {
                    return Container(
                      height: group.isNotEmpty? 80 : 5,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        if(contacts[index-1].select==false) {
                          setState(() {
                            contacts[index-1].select = true;
                            group.add(contacts[index-1]);
                          });
                        }
                        else {
                          setState(() {
                            contacts[index-1].select = false;
                            group.remove(contacts[index-1]);
                          });
                        }
                      },
                      child: ContactCard(chatModel: contacts[index-1]));
                }
          ),
          group.isNotEmpty? Column(
            children: [
              Container(
                height: 75,
                color: Colors.white,
                child: ListView.builder(
                    itemCount: contacts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) {
                      if(contacts[index].select == true) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                contacts[index].select = false;
                                group.remove(contacts[index]);
                              });
                            },
                            child: AvatarCard(chatModel: contacts[index]));
                      }
                      else {
                        return Container();
                      }
                    }
                  )
                ),
              const Divider(thickness: 1.5,)
            ],
          ):Container()
        ],
      ),
    );
  }
}