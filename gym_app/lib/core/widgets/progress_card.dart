import 'package:flutter/material.dart';
import 'animated_ring.dart';
import '../theme/app_colors.dart';

class ProgressCard extends StatelessWidget {
  final String label;
  final String value;
  final String? target;
  final double percentage;
  final Color color;
  final IconData? icon;

  const ProgressCard({
    super.key,
    required this.label,
    required this.value,
    this.target,
    required this.percentage,
    this.color = AppColors.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            AnimatedRing(
              percentage: percentage,
              color: color,
              strokeWidth: 6,
              size: 80,
              label: value,
              subtitle: target != null ? '/ $target' : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (icon != null)
                    Icon(icon, color: color, size: 20),
                  if (icon != null)
                    const SizedBox(height: 4),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: percentage.clamp(0.0, 1.0),
                      backgroundColor: color.withOpacity(0.12),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      minHeight: 4,
                    ),
                  ),
                  if (target != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Target: $target',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
