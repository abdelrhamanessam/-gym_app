import 'package:flutter/material.dart';

class WaterGlass extends StatelessWidget {
  final bool filled;
  final double size;
  final VoidCallback? onTap;

  const WaterGlass({
    super.key,
    this.filled = false,
    this.size = 32,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size * 1.4,
        decoration: BoxDecoration(
          color: filled
              ? const Color(0xFF40C4FF).withOpacity(0.3)
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(size * 0.2),
          border: Border.all(
            color: filled ? const Color(0xFF40C4FF) : Colors.white24,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Icon(
            filled ? Icons.water_drop : Icons.water_drop_outlined,
            color: filled ? const Color(0xFF40C4FF) : Colors.white24,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}
