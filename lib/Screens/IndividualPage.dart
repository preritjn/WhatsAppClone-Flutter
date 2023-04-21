import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/CustomUI/OwnMessageCard.dart';
import 'package:whatsapp_clone/CustomUI/ReplyCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp_clone/Pages/CameraPage.dart';
import '../Model/MessageModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key,required this.chatModel,required this.sourceChat}) : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  late IO.Socket socket;
  bool sendButton = false;
  List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    connect();
    super.initState();
  }

  void connect() {
    socket = IO.io("http://192.168.29.224:3000",<String,dynamic>{
      "transports":["websocket"],
      "autoConnect":false
    });
    socket.connect();
    socket.emit("signin",widget.sourceChat.id);
    socket.onConnect((data) {
      if (kDebugMode) {
        print("Connected");
      }
      socket.on("message", (data) {
        if (kDebugMode) {
          print(data);
        }
        setMessage("target", data["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut);
      });
    });
  }

  void sendMessage(String message,int sourceId,int targetId) {
    setMessage("source", message);
    socket.emit("message",{"message":message,"sourceId":sourceId,"targetId":targetId});
  }

  void setMessage(String type,String message) {
    MessageModel messageModel = MessageModel(message: message, type: type, time: DateTime.now().toString().substring(10,16));
    setState(() {
      messages.add(messageModel);
    });
  }

  Widget bottomSheet() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(width: MediaQuery.of(context).size.width*0.1),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(width: MediaQuery.of(context).size.width*0.1),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.audiotrack_outlined, Colors.deepOrangeAccent, "Audio"),
                  SizedBox(width: MediaQuery.of(context).size.width*0.1),
                  iconCreation(Icons.location_on, Colors.green, "Location"),
                  SizedBox(width: MediaQuery.of(context).size.width*0.1),
                  iconCreation(Icons.payment_rounded, Colors.cyan, "Payment"),
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.perm_contact_calendar_rounded, Colors.blue, "Contact"),
                  SizedBox(width: MediaQuery.of(context).size.width*0.1),
                  iconCreation(Icons.poll_outlined, Colors.cyanAccent, "Poll"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon,Color color,String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30.0,
            child: Icon(
                icon,
                size: 29.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13.0
              ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/background.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: const Color(0xFF075E54),
                leadingWidth: 70.0,
                titleSpacing: 0.0,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                          Icons.arrow_back,
                          size: 24.0,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[500],
                        child: SvgPicture.asset(
                          widget.chatModel.isGroup?
                              'assets/groups.svg':
                              'assets/person.svg',
                          color: Colors.white70,
                          height: 34.0,
                          width: 34.0,
                        ),
                      )
                    ],
                  ),
                ),
                title: InkWell(
                  onTap: () {

                  },
                  child: Container(
                    margin: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.chatModel.name,
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.5
                          ),
                        ),
                        const Text(
                          'last seen at 2:30AM',
                          style: TextStyle(
                            fontSize: 13.0
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {}
                      , icon: const Icon(Icons.videocam)
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.call)
                  ),
                  PopupMenuButton(
                      onSelected: (value) {
                        if (kDebugMode) {
                          print(value);
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return const [
                          PopupMenuItem(value: 'View contact',child: Text('View contact'),),
                          PopupMenuItem(value: 'Media, links and docs',child: Text('Media, links and docs'),),
                          PopupMenuItem(value: 'Search',child: Text('Search'),),
                          PopupMenuItem(value: 'Mute notifications',child: Text('Mute notifications'),),
                          PopupMenuItem(value: 'Disappearing messages',child: Text('Disappearing messages'),),
                          PopupMenuItem(value: 'Wallpaper',child: Text('Wallpaper'),),
                          PopupMenuItem(value: 'Report',child: Text('Report'),),
                          PopupMenuItem(value: 'Block',child: Text('Block'),),
                          PopupMenuItem(value: 'Clear chat',child: Text('Clear chat'),),
                          PopupMenuItem(value: 'Export chat',child: Text('Export chat'),),
                          PopupMenuItem(value: 'Add shortcut',child: Text('Add shortcut'),),
                        ];
                      }),
                ],
              ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context,index) {
                          if(index == messages.length) {
                            return const SizedBox(
                              height: 70,
                            );
                          }
                          if(messages[index].type=="source") {
                            return OwnMessageCard(
                                message: messages[index].message,
                                time: messages[index].time
                            );
                          }
                          else {
                            return ReplyCard(
                                message: messages[index].message,
                                time: messages[index].time
                            );
                          }
                        },
                        itemCount: messages.length+1,
                        shrinkWrap: true,
                        controller: _scrollController,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width -60.0,
                                    child: Card(
                                        margin: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 8.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25.0)
                                        ),
                                        child: TextFormField(
                                          controller: _controller,
                                          textAlignVertical: TextAlignVertical.center,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 5,
                                          minLines: 1,
                                          onChanged: (value) {
                                            if(value.isNotEmpty) {
                                              setState(() {
                                                sendButton = true;
                                              });
                                            }
                                            else {
                                              setState(() {
                                                sendButton = false;
                                              });
                                            }
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Type a message',
                                            contentPadding: const EdgeInsets.all(5.0),
                                            prefixIcon: IconButton(
                                                onPressed: () {
                                                  // show = !show;
                                                },
                                                icon: const Icon(
                                                    Icons.emoji_emotions,
                                                    color: Colors.grey,
                                                ),
                                            ),
                                            suffixIcon: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                          backgroundColor: Colors.transparent,
                                                          context: context,
                                                          builder: (builder)=> bottomSheet()
                                                      );
                                                    },
                                                    icon: const Icon(
                                                        Icons.attach_file,
                                                      color: Colors.grey,
                                                    )
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>const CameraPage()));
                                                    },
                                                    icon: const Icon(
                                                        Icons.camera_alt,
                                                      color: Colors.grey,
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                    ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 8.0),
                                  child: CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: const Color(0xFF128C7E),
                                      child: IconButton(
                                        onPressed: () {
                                          if (sendButton) {
                                            _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                                                duration: const Duration(milliseconds: 300),
                                                curve: Curves.easeOut);
                                            sendMessage(_controller.text,
                                                widget.sourceChat.id,
                                                widget.chatModel.id);
                                            _controller.clear();
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                        icon: Icon(sendButton?Icons.send:Icons.mic,color: Colors.white)
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
        ),
      ],
    );
  }
}