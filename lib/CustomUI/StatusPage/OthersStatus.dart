import 'dart:math';
import 'package:flutter/material.dart';

class OthersStatus extends StatelessWidget {
  const OthersStatus({Key? key,required this.time,required this.imageName,required this.name,required this.isSeen,required this.statusNum}) : super(key: key);
  final String name;
  final String time;
  final String imageName;
  final bool isSeen;
  final int statusNum;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CustomPaint(
          painter: StatusPainter(isSeen: isSeen,statusNum: statusNum),
          child: CircleAvatar(
            radius: 27,
            backgroundImage: AssetImage(imageName),
            backgroundColor: Colors.white,
          ),
        ),
        title: Text(name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        subtitle: Text('Today at, $time',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[900]
          ),
        )
      ),
    );
  }
}

degreeToAngle(double degree) {
  return degree * pi /100;
}

class StatusPainter extends CustomPainter {
  final bool isSeen;
  final int statusNum;
  StatusPainter({required this.statusNum,required this.isSeen});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = isSeen? Colors.grey: const Color(0xff21bfa6)
      ..style = PaintingStyle.stroke;

    if(statusNum == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height), degreeToAngle(0), degreeToAngle(360), false, paint);
    }
    else {
      double degree = -90;
      double arc = 360 / statusNum;
      for(int i=0;i<statusNum;i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height), degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}