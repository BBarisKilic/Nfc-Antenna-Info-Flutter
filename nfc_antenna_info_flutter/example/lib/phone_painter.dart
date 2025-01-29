import 'package:flutter/material.dart';

class PhonePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final phoneBodyPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Draw the phone body
    final phoneBody = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        phoneBody,
        const Radius.circular(30),
      ),
      phoneBodyPaint,
    );

    // Draw the edge-to-edge screen
    final screenPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    const screenMargin = 12.0;
    final screenRect = Rect.fromLTWH(
      screenMargin,
      screenMargin,
      size.width - 2 * screenMargin,
      size.height - 2 * screenMargin,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        screenRect,
        const Radius.circular(20),
      ),
      screenPaint,
    );

    // Draw a small camera cutout at the top
    final cameraPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final cameraRect = Rect.fromCircle(
      center: Offset(size.width / 2, 32),
      radius: 12,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        cameraRect,
        const Radius.circular(12),
      ),
      cameraPaint,
    );

    // Draw side buttons
    final sideButtonPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill;
    final powerButtonRect = Rect.fromLTWH(
      size.width,
      size.height / 6,
      3,
      60,
    );
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        powerButtonRect,
        topRight: const Radius.circular(2),
        bottomRight: const Radius.circular(2),
      ),
      sideButtonPaint,
    );
    final volumeButtonRect = Rect.fromLTWH(
      size.width,
      size.height / 3,
      3,
      120,
    );
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        volumeButtonRect,
        topRight: const Radius.circular(2),
        bottomRight: const Radius.circular(2),
      ),
      sideButtonPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
