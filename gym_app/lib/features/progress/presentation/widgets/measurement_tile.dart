import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import '../../domain/entities/body_measurement.dart';

class MeasurementTile extends StatelessWidget {
  final BodyMeasurement measurement;
  final bool isExpanded;

  const MeasurementTile({
    super.key,
    required this.measurement,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM d, yyyy').format(measurement.date);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border.withOpacity(0.3)),
      ),
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.monitor_weight_rounded,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateStr,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '${measurement.weightKg.toStringAsFixed(1)} kg',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _MeasurementRow(
                    label: 'Weight',
                    value: '${measurement.weightKg.toStringAsFixed(1)} kg'),
                if (measurement.bodyFatPercent != null)
                  _MeasurementRow(
                      label: 'Body Fat',
                      value: '${measurement.bodyFatPercent!.toStringAsFixed(1)}%'),
                if (measurement.leanBodyMassKg != null)
                  _MeasurementRow(
                      label: 'Lean Mass',
                      value:
                          '${measurement.leanBodyMassKg!.toStringAsFixed(1)} kg'),
                if (measurement.muscleMassKg != null)
                  _MeasurementRow(
                      label: 'Muscle Mass',
                      value:
                          '${measurement.muscleMassKg!.toStringAsFixed(1)} kg'),
                if (measurement.waistCm != null)
                  _MeasurementRow(
                      label: 'Waist',
                      value: '${measurement.waistCm!.toStringAsFixed(1)} cm'),
                if (measurement.chestCm != null)
                  _MeasurementRow(
                      label: 'Chest',
                      value: '${measurement.chestCm!.toStringAsFixed(1)} cm'),
                if (measurement.armCm != null)
                  _MeasurementRow(
                      label: 'Arm',
                      value: '${measurement.armCm!.toStringAsFixed(1)} cm'),
                if (measurement.legCm != null)
                  _MeasurementRow(
                      label: 'Leg',
                      value: '${measurement.legCm!.toStringAsFixed(1)} cm'),
                if (measurement.notes != null &&
                    measurement.notes!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      measurement.notes!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        fontFamily: 'Poppins',
                      ),
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

class _MeasurementRow extends StatelessWidget {
  final String label;
  final String value;

  const _MeasurementRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
