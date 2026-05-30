import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_colors.dart';

class StatsRow extends StatelessWidget {
  final List<StatItem> items;

  const StatsRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.map((item) => Expanded(child: item)).toList(),
    );
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String label;
  final double? change;
  final IconData? icon;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
    this.change,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Icon(icon, color: AppColors.primary, size: 20),
            ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
          if (change != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    change! >= 0
                        ? Icons.arrow_upward_rounded
                        : Icons.arrow_downward_rounded,
                    size: 12,
                    color: change! >= 0 ? AppColors.success : AppColors.error,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    '${change!.abs().toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: change! >= 0
                          ? AppColors.success
                          : AppColors.error,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
