import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/widgets/loading_widget.dart';
import 'package:gym_app/core/widgets/error_widget.dart';
import '../../domain/entities/body_measurement.dart';
import '../providers/progress_providers.dart';
import '../widgets/stats_row.dart';
import '../widgets/measurement_tile.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final measurementsAsync = ref.watch(measurementsProvider);
    final latestAsync = ref.watch(latestMeasurementProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Progress'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_rounded),
            onPressed: () => context.push('/progress/photos'),
          ),
          IconButton(
            icon: const Icon(Icons.flag_rounded),
            onPressed: () => context.push('/progress/goals'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/progress/add'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Log Measurement'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(measurementsProvider);
          ref.invalidate(latestMeasurementProvider);
        },
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
          children: [
            latestAsync.when(
              loading: () => const LoadingWidget(height: 120),
              error: (e, _) => AppErrorWidget(message: e.toString()),
              data: (latest) {
                if (latest == null) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: AppColors.border.withOpacity(0.3)),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.monitor_weight_rounded,
                            color: AppColors.textHint, size: 40),
                        SizedBox(height: 12),
                        Text(
                          'Log your first measurement',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return StatsRow(items: [
                  StatItem(
                    value: '${latest.weightKg.toStringAsFixed(1)}',
                    label: 'kg\nWeight',
                    icon: Icons.monitor_weight_rounded,
                  ),
                  StatItem(
                    value: latest.bodyFatPercent != null
                        ? '${latest.bodyFatPercent!.toStringAsFixed(1)}%'
                        : '--',
                    label: 'Body\nFat',
                    icon: Icons.percent_rounded,
                  ),
                  StatItem(
                    value: latest.leanBodyMassKg != null
                        ? '${latest.leanBodyMassKg!.toStringAsFixed(1)}'
                        : '--',
                    label: 'kg\nLean Mass',
                    icon: Icons.fitness_center_rounded,
                  ),
                ]);
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Weight Trend',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 12),
            measurementsAsync.when(
              loading: () => const LoadingWidget(height: 200),
              error: (e, _) => AppErrorWidget(message: e.toString()),
              data: (measurements) {
                if (measurements.length < 2) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        'Add more measurements to see your trend',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  );
                }
                final sorted = [...measurements]
                  ..sort((a, b) => a.date.compareTo(b.date));
                final last30 =
                    sorted.where((m) => m.date
                            .isAfter(DateTime.now().subtract(const Duration(days: 30))))
                        .toList();
                final chartData =
                    last30.length >= 2 ? last30 : sorted.sublist(sorted.length - 5);

                return Container(
                  height: 220,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: AppColors.border.withOpacity(0.3)),
                  ),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 5,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: AppColors.border.withOpacity(0.2),
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) => Text(
                              '${value.toInt()}',
                              style: const TextStyle(
                                fontSize: 10,
                                color: AppColors.textHint,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: (chartData.length / 4).ceilToDouble().clamp(1, 7),
                            getTitlesWidget: (value, meta) {
                              final idx = value.toInt();
                              if (idx < 0 || idx >= chartData.length) {
                                return const SizedBox();
                              }
                              return Text(
                                DateFormat('M/d').format(chartData[idx].date),
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: AppColors.textHint,
                                  fontFamily: 'Poppins',
                                ),
                              );
                            },
                          ),
                        ),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(show: false),
                      minY: (chartData.map((m) => m.weightKg).reduce(
                                  (a, b) => a < b ? a : b) -
                              3)
                          .clamp(0, 1000),
                      maxY: (chartData.map((m) => m.weightKg).reduce(
                                  (a, b) => a > b ? a : b) +
                              3)
                          .clamp(0, 1000),
                      lineBarsData: [
                        LineChartBarData(
                          spots: chartData
                              .asMap()
                              .entries
                              .map((e) =>
                                  FlSpot(e.key.toDouble(), e.value.weightKg))
                              .toList(),
                          isCurved: true,
                          color: AppColors.primary,
                          barWidth: 3,
                          dotData: FlDotData(
                            show: chartData.length < 15,
                            getDotPainter: (spot, percent, bar, index) =>
                                FlDotCirclePainter(
                              radius: 4,
                              color: AppColors.primary,
                              strokeWidth: 2,
                              strokeColor: AppColors.background,
                            ),
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            color: AppColors.primary.withOpacity(0.1),
                          ),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipItems: (touchedSpots) =>
                              touchedSpots.map((spot) {
                            return LineTooltipItem(
                              '${spot.y.toStringAsFixed(1)} kg',
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: 13,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Measurement History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 12),
            measurementsAsync.when(
              loading: () => const LoadingScreen(),
              error: (e, _) => AppErrorWidget(message: e.toString()),
              data: (measurements) {
                if (measurements.isEmpty) {
                  return const SizedBox();
                }
                return Column(
                  children: measurements
                      .map((m) => MeasurementTile(measurement: m))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
