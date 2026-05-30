import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import '../../domain/entities/water_log.dart';
import '../providers/nutrition_providers.dart';
import '../widgets/water_glass.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

class WaterTrackerScreen extends ConsumerStatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  ConsumerState<WaterTrackerScreen> createState() =>
      _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends ConsumerState<WaterTrackerScreen> {
  DateTime _selectedDate = DateTime.now();
  final double _glassSize = 250;

  Future<void> _addWater() async {
    final authUser = ref.read(authStateProvider).valueOrNull;
    if (authUser == null) return;

    final waterLog = WaterLog(
      id: const Uuid().v4(),
      userId: authUser.uid,
      date: _selectedDate,
      amountMl: _glassSize,
      createdAt: DateTime.now(),
    );

    try {
      await ref.read(logWaterActionProvider(waterLog: waterLog).future);
      ref.invalidate(waterForDateProvider);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  Future<void> _removeLastGlass(List<WaterLog> logs) async {
    if (logs.isEmpty) return;
    final last = logs.last;
    // TODO: Delete water log from Firestore
  }

  @override
  Widget build(BuildContext context) {
    final waterAsync = ref.watch(waterForDateProvider(date: _selectedDate));
    final goalsAsync = ref.watch(nutritionGoalsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: () {
                    setState(() =>
                        _selectedDate = _selectedDate.subtract(const Duration(days: 1)));
                  },
                ),
                Text(
                  DateFormat('MMM dd, yyyy').format(_selectedDate),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right_rounded),
                  onPressed: () {
                    setState(() =>
                        _selectedDate = _selectedDate.add(const Duration(days: 1)));
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            goalsAsync.when(
              data: (goals) {
                return waterAsync.when(
                  data: (logs) {
                    final totalWater =
                        logs.fold<double>(0, (sum, log) => sum + log.amountMl);
                    final goalMl = goals.dailyWaterMl;
                    final glasses = (goalMl / _glassSize).ceil();
                    final filled = (totalWater / _glassSize).floor();

                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 200,
                              child: CircularProgressIndicator(
                                value: (totalWater / goalMl).clamp(0.0, 1.0),
                                strokeWidth: 12,
                                backgroundColor: Colors.white.withOpacity(0.1),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF40C4FF),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${totalWater.toStringAsFixed(0)}ml',
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF40C4FF),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  'of ${goalMl.toStringAsFixed(0)}ml',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white54,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(glasses, (i) {
                            return WaterGlass(
                              filled: i < filled,
                              size: 36,
                              onTap: i == filled
                                  ? _addWater
                                  : null,
                            );
                          }),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$filled / $glasses glasses',
                          style: const TextStyle(
                            color: Colors.white54,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton.icon(
                                  onPressed: _addWater,
                                  icon: const Icon(Icons.add_rounded),
                                  label: const Text('Add Glass'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: OutlinedButton.icon(
                                  onPressed:
                                      filled > 0 ? () => _removeLastGlass(logs) : null,
                                  icon: const Icon(Icons.remove_rounded),
                                  label: const Text('Remove'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (logs.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'History',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...logs.reversed.take(20).map((log) => ListTile(
                                dense: true,
                                leading: const Icon(Icons.water_drop,
                                    color: Color(0xFF40C4FF), size: 20),
                                title: Text(
                                  '${log.amountMl.toStringAsFixed(0)}ml',
                                  style: const TextStyle(fontFamily: 'Poppins'),
                                ),
                                subtitle: Text(
                                  DateFormat('hh:mm a').format(log.createdAt),
                                  style: const TextStyle(fontFamily: 'Poppins'),
                                ),
                              )),
                        ],
                      ],
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error: $e')),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ],
        ),
      ),
    );
  }
}
