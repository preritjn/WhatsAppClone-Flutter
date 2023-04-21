import 'package:flutter/material.dart';

class HeadOwnStatus extends StatelessWidget {
  const HeadOwnStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: Stack(
          children: [
            const CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/1.jpg"),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.greenAccent[700],
                  child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                  ),
                )
            )
          ],
        ),
        title: const Text('My Status',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black
          ),
        ),
        subtitle: Text('Tap to add status update',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[900]
            ),
        ),
      ),
    );
  }
}