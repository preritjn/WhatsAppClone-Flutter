import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/StatusPage/HeadOwnStatus.dart';
import 'package:whatsapp_clone/CustomUI/StatusPage/OthersStatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  Widget label(String labelName) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 17),
      color: Colors.grey[300],
      height: 33,
      width: MediaQuery.of(context).size.width,
      child: Text(labelName,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
          )
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blueGrey[100],
            elevation: 8,
            child: Icon(
              Icons.edit,
              color: Colors.blueGrey[900]
            ),
          ),
          const SizedBox(height: 13),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: const Icon(
                Icons.camera_alt
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeadOwnStatus(),
            label("Recent Updates"),
            const OthersStatus(name: 'Prerit Kumar Jain',time: '1:23AM',imageName: 'assets/2.jpg',isSeen: false,statusNum: 1),
            const OthersStatus(name: 'Prerit Agrawal',time: '2:23AM',imageName: 'assets/3.jpg',isSeen: false,statusNum: 2),
            const OthersStatus(name: 'Lotus Mishra',time: '3:23AM',imageName: 'assets/4.jpg',isSeen: false,statusNum: 3),
            const OthersStatus(name: 'Situ Tayal',time: '4:23AM',imageName: 'assets/1.jpg',isSeen: false,statusNum: 4),
            const OthersStatus(name: 'Prerit Kumar Jain',time: '1:23AM',imageName: 'assets/2.jpg',isSeen: false,statusNum: 5),
            const OthersStatus(name: 'Lotus Mishra',time: '3:23AM',imageName: 'assets/4.jpg',isSeen: false,statusNum: 6),
            label("Viewed Updates"),
            const OthersStatus(name: 'Prerit Kumar Jain',time: '1:23AM',imageName: 'assets/2.jpg',isSeen: true,statusNum: 7),
            const OthersStatus(name: 'Prerit Agrawal',time: '2:23AM',imageName: 'assets/3.jpg',isSeen: true,statusNum: 8),
            const OthersStatus(name: 'Lotus Mishra',time: '3:23AM',imageName: 'assets/4.jpg',isSeen: true,statusNum: 9),
            const OthersStatus(name: 'Situ Tayal',time: '4:23AM',imageName: 'assets/1.jpg',isSeen: true,statusNum: 10),
            const OthersStatus(name: 'Prerit Kumar Jain',time: '1:23AM',imageName: 'assets/2.jpg',isSeen: true,statusNum: 11),
            const OthersStatus(name: 'Lotus Mishra',time: '3:23AM',imageName: 'assets/4.jpg',isSeen: true,statusNum: 12),
          ],
        ),
      ),
    );
  }
}