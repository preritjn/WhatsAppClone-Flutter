import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key,required this.message,required this.time}) : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
          color: const Color(0xffdcf8c6),
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
                child: Row(
                  children:[
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.done_all,size: 20)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}