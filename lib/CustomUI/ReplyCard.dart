import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key,required this.message,required this.time}) : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 40,top: 10,bottom: 20),
                child: Text(
                  message,
                  style: const TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                    time,
                    style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}