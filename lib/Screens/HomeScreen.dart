import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreen/CallScreen.dart';
import 'package:whatsapp_clone/Pages/CameraPage.dart';
import 'package:whatsapp_clone/Pages/ChatsPage.dart';
import 'package:whatsapp_clone/Pages/StatusPage.dart';
import '../Model/ChatModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,required this.chatModels,required this.sourceChat}) : super(key: key);

  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        title: const Text('WhatsApp Clone'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search)
          ),
          PopupMenuButton(
              onSelected: (value) {
                if (kDebugMode) {
                  print(value);
                }
              },
              itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(value: 'New Group',child: Text('New Group'),),
                PopupMenuItem(value: 'New Broadcast',child: Text('New Broadcast'),),
                PopupMenuItem(value: 'Linked Devices',child: Text('Linked Devices'),),
                PopupMenuItem(value: 'Starred Messages',child: Text('Starred Messages'),),
                PopupMenuItem(value: 'Payments',child: Text('Payments'),),
                PopupMenuItem(value: 'Settings',child: Text('Settings'),)
            ];
            }),
          ],
        bottom: TabBar(
          indicatorWeight: 3.0,
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'Chats',
            ),
            Tab(
              text: 'Status',
            ),
            Tab(
              text: 'Calls',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          const CameraPage(),
          ChatsPage(chatModels: widget.chatModels,sourceChat: widget.sourceChat),
          const StatusPage(),
          const CallScreen()
        ],
      ),
    );
  }
}