import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  Widget callCard(String name,String time,IconData iconData,Color iconColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 0.2),
      child: ListTile(
        leading: CircleAvatar(
          radius: 27,
          backgroundColor: Colors.grey[500],
          child: SvgPicture.asset(
            'assets/person.svg',
            color: Colors.white70,
            height: 38.0,
            width: 38.0,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
          )
        ),
        subtitle: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 24,
            ),
            const SizedBox(width: 4),
            Text(
              time,
              style: const TextStyle(
                fontSize: 14.5
              )
            )
          ],
        ),
        trailing: const Icon(
            Icons.call,
            size: 28,
            color: Colors.teal
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          callCard('Prerit Kumar Jain','October 30th, 6:10 AM',Icons.call_received,Colors.green),
          callCard('Prerit Agrawal','October 30th, 6:11 AM',Icons.call_received,Colors.green),
          callCard('Prerit','October 30th, 6:12 AM',Icons.call_missed,Colors.red),
          callCard('Prerit','October 30th, 6:13 AM',Icons.call_received,Colors.green),
          callCard('Prerit','October 30th, 6:14 AM',Icons.call_missed,Colors.red),
          callCard('Prerit','October 30th, 6:15 AM',Icons.call_received,Colors.green),
          callCard('Prerit','October 30th, 6:16 AM',Icons.call_received,Colors.green),
          callCard('Prerit','October 30th, 6:14 AM',Icons.call_missed,Colors.red),
          callCard('Prerit','October 30th, 6:17 AM',Icons.call_received,Colors.green),
          callCard('Prerit','October 30th, 6:14 AM',Icons.call_missed,Colors.red),
          callCard('Prerit','October 30th, 6:20 AM',Icons.call_received,Colors.green),
          callCard('Prerit','October 30th, 6:21 AM',Icons.call_received,Colors.green),
        ],
      )
    );
  }
}