import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CustomSliderMarkShape extends SliderComponentShape {
  final double tickMarkRadius;
  final double sliderValue;

  CustomSliderMarkShape({
    required this.tickMarkRadius,
    required this.sliderValue,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(tickMarkRadius, tickMarkRadius);
  }

  @override
  Future<void> paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) async {
    final Canvas canvas = context.canvas;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromCenter(center: center, width: 28, height: 28),
          const Radius.circular(16)),
      Paint()..color = Colors.green,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromCenter(center: center, width: 28, height: 28),
          const Radius.circular(16)),
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    final triangle = Path();
    triangle.moveTo(5, 28);
    triangle.relativeLineTo(20, 20);
    triangle.relativeLineTo(20, -20);
    triangle.relativeLineTo(-20, -20);

    canvas.drawPath(
      triangle,
      Paint()
        ..strokeWidth = 2
        ..color = Colors.indigoAccent
        ..style = PaintingStyle.fill,
    );

    TextSpan span = TextSpan(
      style: TextStyle(
          fontSize: tickMarkRadius * 0.9,
          fontWeight: FontWeight.w700,
          color: Colors.black),
      text: sliderValue.round().toString(),
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();

    Offset textCenter = Offset(
      center.dx - (tp.width / 2),
      center.dy - (tp.height / 2),
    );
    tp.paint(canvas, textCenter);
  }
}
