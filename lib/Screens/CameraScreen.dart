import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/CameraView.dart';
import 'VideoView.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool cameraPosition = false;

  @override
  void initState() {
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(_cameraController)
                  );
                }
                else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.black,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash? _cameraController.setFlashMode(FlashMode.torch):_cameraController.setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                              flash?Icons.flash_on:
                              Icons.flash_off,
                              color: Colors.white,
                              size: 30
                          )
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          try {
                            await _cameraController.startVideoRecording();
                            setState(() {
                              isRecording = true;
                            });
                            if(!mounted) {
                              return;
                            }
                          }
                          catch(err) {
                            if (kDebugMode) {
                              print(err);
                            }
                          }
                        },
                        onLongPressUp: () async {
                          XFile video = await _cameraController.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder)=>
                                      VideoViewPage(path: video.path)));
                        },
                        onTap: () async {
                          if(!isRecording) {
                            try {
                              await cameraValue;
                              XFile image = await _cameraController.takePicture();
                              if (!mounted) {
                                return;
                              }
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CameraViewPage(path: image.path)));
                            }
                            catch (err) {
                              if (kDebugMode) {
                                print(err);
                              }
                            }
                          }
                        },
                        child: isRecording? const Icon(
                            Icons.radio_button_on,
                            color: Colors.red,
                            size: 70):const Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.white,
                            size: 70
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              cameraPosition = !cameraPosition;
                            });
                            int value = cameraPosition?1:0;
                            _cameraController = CameraController(cameras[value], ResolutionPreset.high);
                            cameraValue = _cameraController.initialize();
                          },
                          icon: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 30
                          )
                      ),
                    ],
                  ),
                  const Text(
                    'Hold for video, tap for photo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}