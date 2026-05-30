import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/analytics_providers.dart';
import '../widgets/interactive_chart.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  ChartPeriod _selectedPeriod = ChartPeriod.weekly;

  @override
  Widget build(BuildContext context) {
    final weightAsync = ref.watch(weightChartDataProvider(_selectedPeriod));
    final caloriesAsync = ref.watch(caloriesChartDataProvider(_selectedPeriod));
    final proteinAsync = ref.watch(proteinChartDataProvider(_selectedPeriod));
    final bodyFatAsync = ref.watch(bodyFatChartDataProvider(_selectedPeriod));
    final muscleAsync = ref.watch(muscleMassChartDataProvider(_selectedPeriod));
    final goalAsync = ref.watch(goalPredictionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ChartPeriod.values.map((period) {
                  final isSelected = period == _selectedPeriod;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        period.name[0].toUpperCase() + period.name.substring(1),
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() => _selectedPeriod = period);
                      },
                      selectedColor: AppColors.primary.withOpacity(0.15),
                      backgroundColor: AppColors.surfaceLight,
                      side: BorderSide(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.border,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            weightAsync.when(
              data: (spots) => InteractiveChart(
                title: 'Weight',
                spots: spots,
                lineColor: AppColors.primary,
                gradientColor: AppColors.primary,
                unit: 'kg',
              ),
              loading: () => const Card(child: SizedBox(height: 200, child: Center(child: CircularProgressIndicator()))),
              error: (e, _) => Card(child: SizedBox(height: 200, child: Center(child: Text('$e')))),
            ),
            const SizedBox(height: 12),
            caloriesAsync.when(
              data: (spots) => InteractiveChart(
                title: 'Calories',
                spots: spots,
                lineColor: AppColors.warning,
                gradientColor: AppColors.warning,
                unit: 'kcal',
              ),
              loading: () => const Card(child: SizedBox(height: 200, child: Center(child: CircularProgressIndicator()))),
              error: (e, _) => Card(child: SizedBox(height: 200, child: Center(child: Text('$e')))),
            ),
            const SizedBox(height: 12),
            proteinAsync.when(
              data: (spots) => InteractiveChart(
                title: 'Protein',
                spots: spots,
                lineColor: AppColors.info,
                gradientColor: AppColors.info,
                unit: 'g',
              ),
              loading: () => const Card(child: SizedBox(height: 200, child: Center(child: CircularProgressIndicator()))),
              error: (e, _) => Card(child: SizedBox(height: 200, child: Center(child: Text('$e')))),
            ),
            const SizedBox(height: 12),
            bodyFatAsync.when(
              data: (spots) => InteractiveChart(
                title: 'Body Fat',
                spots: spots,
                lineColor: AppColors.secondary,
                gradientColor: AppColors.secondary,
                unit: '%',
              ),
              loading: () => const Card(child: SizedBox(height: 200, child: Center(child: CircularProgressIndicator()))),
              error: (e, _) => Card(child: SizedBox(height: 200, child: Center(child: Text('$e')))),
            ),
            const SizedBox(height: 12),
            muscleAsync.when(
              data: (spots) => InteractiveChart(
                title: 'Muscle Mass',
                spots: spots,
                lineColor: AppColors.accent,
                gradientColor: AppColors.accent,
                unit: 'kg',
              ),
              loading: () => const Card(child: SizedBox(height: 200, child: Center(child: CircularProgressIndicator()))),
              error: (e, _) => Card(child: SizedBox(height: 200, child: Center(child: Text('$e')))),
            ),
            const SizedBox(height: 12),
            goalAsync.when(
              data: (goal) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.flag_rounded, color: AppColors.primary),
                          SizedBox(width: 8),
                          Text(
                            'Goal Prediction',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _metricColumn('Current', '${goal.currentWeight.toStringAsFixed(1)} kg'),
                          _metricColumn('Goal', '${goal.goalWeight.toStringAsFixed(1)} kg'),
                          _metricColumn('Progress', '${goal.progressPercent.toStringAsFixed(0)}%'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: (goal.progressPercent / 100).clamp(0.0, 1.0),
                          backgroundColor: AppColors.primary.withOpacity(0.12),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Estimated completion: ${goal.estimatedCompletionDate.month}/${goal.estimatedCompletionDate.day}/${goal.estimatedCompletionDate.year}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${goal.weeksRemaining} weeks remaining',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textHint,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              loading: () => const Card(child: SizedBox(height: 200, child: Center(child: CircularProgressIndicator()))),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _metricColumn(String label, String value) {
    return Column(
      children: [
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
            fontSize: 12,
            color: AppColors.textSecondary,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
