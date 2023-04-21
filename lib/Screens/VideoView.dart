import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewPage extends StatefulWidget {
  const VideoViewPage({Key? key,required this.path}) : super(key: key);
  final String path;

  @override
  State<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

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
              child: _controller.value.isInitialized? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ) : Container(),
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
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying?
                    _controller.pause():
                    _controller.play();
                  });
                },
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.black38,
                  child: Icon(
                      _controller.value.isPlaying?
                      Icons.pause:
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 50
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