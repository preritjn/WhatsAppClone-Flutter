import 'dart:io';
import 'package:flutter/material.dart';

class CameraViewPage extends StatelessWidget {
  const CameraViewPage({Key? key,required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                  Icons.crop_rotate,
                size: 29,
              )
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.emoji_emotions_outlined,
                size: 29,
              )
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.title,
                size: 29,
              )
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                size: 29,
              )
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-150,
              child: Image.file(
                  File(path),
                  fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add Caption...",
                    prefixIcon: Icon(Icons.add_photo_alternate,size: 27,color: Colors.white),
                    suffixIcon: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF075E54),
                      child: Icon(Icons.check,color: Colors.white,size: 27),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}