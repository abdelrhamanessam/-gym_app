import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import '../../domain/entities/ai_advice.dart';

class AdviceCard extends StatelessWidget {
  final AiAdvice advice;

  const AdviceCard({super.key, required this.advice});

  IconData _getTypeIcon() {
    switch (advice.type) {
      case AdviceType.nutrition:
        return Icons.restaurant_rounded;
      case AdviceType.fitness:
        return Icons.fitness_center_rounded;
      case AdviceType.general:
        return Icons.lightbulb_rounded;
    }
  }

  Color _getTypeColor() {
    switch (advice.type) {
      case AdviceType.nutrition:
        return AppColors.warning;
      case AdviceType.fitness:
        return AppColors.primary;
      case AdviceType.general:
        return AppColors.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getTypeColor();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(_getTypeIcon(), color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        advice.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        advice.type.name[0].toUpperCase() +
                            advice.type.name.substring(1),
                        style: TextStyle(
                          fontSize: 12,
                          color: color,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              advice.message,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                fontFamily: 'Poppins',
                height: 1.5,
              ),
            ),
            if (advice.actionItems.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Divider(color: AppColors.divider),
              const SizedBox(height: 8),
              const Text(
                'Action Items',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              ...advice.actionItems.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle_outline_rounded,
                          size: 16,
                          color: color,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ],
        ),
      ),
    );
  }
}
