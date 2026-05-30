import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedRing extends StatefulWidget {
  final double percentage;
  final Color color;
  final double strokeWidth;
  final String? label;
  final String? subtitle;
  final double size;

  const AnimatedRing({
    super.key,
    required this.percentage,
    this.color = const Color(0xFF00E676),
    this.strokeWidth = 10,
    this.label,
    this.subtitle,
    this.size = 120,
  });

  @override
  State<AnimatedRing> createState() => _AnimatedRingState();
}

class _AnimatedRingState extends State<AnimatedRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(listenable: _animation,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _RingPainter(
                  percentage: widget.percentage * _animation.value,
                  color: widget.color,
                  strokeWidth: widget.strokeWidth,
                  backgroundColor: widget.color.withOpacity(0.12),
                ),
              ),
              if (widget.label != null || widget.subtitle != null)
                FadeTransition(
                  opacity: _animation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.label != null)
                        Text(
                          widget.label!,
                          style: TextStyle(
                            fontSize: widget.size * 0.16,
                            fontWeight: FontWeight.w700,
                            color: widget.color,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      if (widget.subtitle != null)
                        Text(
                          widget.subtitle!,
                          style: TextStyle(
                            fontSize: widget.size * 0.08,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                            fontFamily: 'Poppins',
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  final double percentage;
  final Color color;
  final double strokeWidth;
  final Color backgroundColor;

  _RingPainter({
    required this.percentage,
    required this.color,
    required this.strokeWidth,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * (percentage.clamp(0.0, 1.0));
    canvas.drawArc(rect, -pi / 2, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) {
    return oldDelegate.percentage != percentage ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

