
import 'dart:math' as math;
import 'package:flutter/material.dart';

class SemiCircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;

  SemiCircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.4); // Center উপরে
    final radius = (size.width - strokeWidth) / 2;

    // Background arc - longer arc (220 degrees)
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Start থেকে 220 degrees arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 0.7, // Start angle (প্রায় bottom-left থেকে)
      math.pi * 1.6, // 220 degrees arc
      false,
      backgroundPaint,
    );

    // Progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 0.7, // Same start angle
      math.pi * 1.6 * progress, // Progress based sweep
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(SemiCircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}