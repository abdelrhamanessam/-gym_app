import 'package:flutter/material.dart';
import 'package:gym_app/core/widgets/animated_ring.dart';

class AnimatedRingCard extends StatelessWidget {
  final String label;
  final double percentage;
  final String currentValue;
  final String targetValue;
  final Color color;
  final IconData? icon;

  const AnimatedRingCard({
    super.key,
    required this.label,
    required this.percentage,
    required this.currentValue,
    required this.targetValue,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedRing(
              percentage: percentage.clamp(0.0, 1.0),
              color: color,
              strokeWidth: 8,
              size: 100,
              label: currentValue,
              subtitle: targetValue,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 14, color: color),
                  const SizedBox(width: 4),
                ],
                Flexible(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      fontFamily: 'Poppins',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
