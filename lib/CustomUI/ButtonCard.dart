import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key,required this.name,required this.icon}) : super(key: key);
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFF25D366),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          )
        ),
        title: Text(
          name,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}