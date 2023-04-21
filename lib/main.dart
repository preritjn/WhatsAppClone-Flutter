import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/LoginScreen.dart';
import 'Screens/CameraScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFF075E54),
        accentColor: const Color(0xFF128C7E)
    ),
    home: const LoginScreen(),
  ));
}