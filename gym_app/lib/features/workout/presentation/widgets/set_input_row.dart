import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_colors.dart';

class SetInputRow extends StatelessWidget {
  final int setNumber;
  final TextEditingController weightController;
  final TextEditingController repsController;
  final double rpe;
  final ValueChanged<double> onRpeChanged;
  final VoidCallback onComplete;
  final bool isLast;

  const SetInputRow({
    super.key,
    required this.setNumber,
    required this.weightController,
    required this.repsController,
    required this.rpe,
    required this.onRpeChanged,
    required this.onComplete,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isLast ? AppColors.primary.withOpacity(0.3) : AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$setNumber',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Set',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              Icon(
                isLast ? Icons.fitness_center_rounded : Icons.check_circle_outline,
                color: isLast ? AppColors.primary : AppColors.textHint,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: weightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                    suffixText: 'kg',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: repsController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Reps',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text(
                'RPE',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Slider(
                  value: rpe,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: rpe.toStringAsFixed(0),
                  onChanged: onRpeChanged,
                ),
              ),
              SizedBox(
                width: 32,
                child: Text(
                  rpe.toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onComplete,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 44),
                backgroundColor: isLast ? AppColors.primary : AppColors.surfaceLight,
                foregroundColor: isLast ? AppColors.textOnPrimary : AppColors.primary,
                side: isLast ? null : const BorderSide(color: AppColors.primary),
              ),
              child: Text(isLast ? 'Complete Set' : 'Add Set'),
            ),
          ),
        ],
      ),
    );
  }
}
