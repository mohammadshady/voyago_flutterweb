import 'package:flutter/material.dart';


class TrianglePainter extends CustomPainter {
  final bool isRTL;

  TrianglePainter({this.isRTL = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();

    if (!isRTL) {
      // LTR triangle (points to left)
      path.moveTo(0, size.height / 2); // middle left
      path.lineTo(size.width, 0); // top right
      path.lineTo(size.width, size.height); // bottom right
    } else {
      // RTL triangle (points to right)
      path.moveTo(size.width, size.height / 2); // middle right
      path.lineTo(0, 0); // top left
      path.lineTo(0, size.height); // bottom left
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TriangleWidget extends StatelessWidget {
  final bool isRTL;

  const TriangleWidget({super.key, required this.isRTL});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(20, 40),
      painter: TrianglePainter(isRTL: isRTL),
    );
  }
}







