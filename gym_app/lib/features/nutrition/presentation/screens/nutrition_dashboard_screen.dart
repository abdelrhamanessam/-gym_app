import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import '../../domain/entities/water_log.dart';
import '../../domain/entities/nutrition_goals.dart';
import '../providers/nutrition_providers.dart';
import '../widgets/animated_ring_card.dart';
import '../widgets/meal_tile.dart';
import '../widgets/water_glass.dart';
import '../widgets/add_meal_bottom_sheet.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

class NutritionDashboardScreen extends ConsumerStatefulWidget {
  const NutritionDashboardScreen({super.key});

  @override
  ConsumerState<NutritionDashboardScreen> createState() =>
      _NutritionDashboardScreenState();
}

class _NutritionDashboardScreenState
    extends ConsumerState<NutritionDashboardScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final goalsAsync = ref.watch(nutritionGoalsProvider);
    final mealsAsync = ref.watch(mealsForDateProvider(date: _selectedDate));
    final waterAsync = ref.watch(waterForDateProvider(date: _selectedDate));
    final summaryAsync = ref.watch(dailySummaryProvider(date: _selectedDate));

    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('MMM dd, yyyy').format(_selectedDate)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () => context.push('/nutrition/search'),
          ),
          IconButton(
            icon: const Icon(Icons.today_rounded),
            onPressed: _showDatePicker,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMealSheet,
        child: const Icon(Icons.add_rounded),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(mealsForDateProvider);
          ref.invalidate(waterForDateProvider);
          ref.invalidate(dailySummaryProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              goalsAsync.when(
                data: (goals) => _buildMacroRings(goals),
                loading: () => const Center(
                    child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                )),
                error: (e, _) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text('Error: $e'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Water Intake',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              waterAsync.when(
                data: (waterLogs) {
                  final totalWater =
                      waterLogs.fold<double>(0, (sum, w) => sum + w.amountMl);
                  return _buildWaterTracker(totalWater);
                },
                loading: () => const SizedBox(
                  height: 60,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, _) => Text('Error: $e'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Meals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              mealsAsync.when(
                data: (meals) {
                  if (meals.isEmpty) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Center(
                          child: Text(
                            'No meals logged today\nTap + to add a meal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white54,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return MealTile(
                        meal: meal,
                        onTap: () => context.push('/nutrition/meal/${meal.id}'),
                      );
                    },
                  );
                },
                loading: () => const SizedBox(
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, _) => Text('Error: $e'),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMacroRings(NutritionGoals goals) {
    return summaryAsync.when(
      data: (summary) {
        final calPercent =
            goals.dailyCalories > 0 ? summary.totalCalories / goals.dailyCalories : 0.0;
        final proteinPercent =
            goals.dailyProtein > 0 ? summary.totalProtein / goals.dailyProtein : 0.0;
        final carbsPercent =
            goals.dailyCarbs > 0 ? summary.totalCarbs / goals.dailyCarbs : 0.0;
        final fatPercent =
            goals.dailyFat > 0 ? summary.totalFat / goals.dailyFat : 0.0;

        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.9,
          children: [
            AnimatedRingCard(
              label: 'Calories',
              percentage: calPercent,
              currentValue: summary.totalCalories.toStringAsFixed(0),
              targetValue: goals.dailyCalories.toString(),
              color: const Color(0xFFFF6D00),
              icon: Icons.local_fire_department_rounded,
            ),
            AnimatedRingCard(
              label: 'Protein',
              percentage: proteinPercent,
              currentValue: summary.totalProtein.toStringAsFixed(0),
              targetValue: '${goals.dailyProtein}g',
              color: const Color(0xFF40C4FF),
              icon: Icons.fitness_center_rounded,
            ),
            AnimatedRingCard(
              label: 'Carbs',
              percentage: carbsPercent,
              currentValue: summary.totalCarbs.toStringAsFixed(0),
              targetValue: '${goals.dailyCarbs}g',
              color: const Color(0xFFCE93D8),
              icon: Icons.grain_rounded,
            ),
            AnimatedRingCard(
              label: 'Fat',
              percentage: fatPercent,
              currentValue: summary.totalFat.toStringAsFixed(0),
              targetValue: '${goals.dailyFat}g',
              color: const Color(0xFFEF5350),
              icon: Icons.opacity_rounded,
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }

  Widget _buildWaterTracker(double totalWater) {
    return goalsAsync.when(
      data: (goals) {
        final goalMl = goals.dailyWaterMl;
        final glasses = (goalMl / 250).round();
        final filledGlasses = (totalWater / 250).round().clamp(0, glasses);

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${totalWater.toStringAsFixed(0)}ml / ${goalMl.toStringAsFixed(0)}ml',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => _handleAddWater(),
                      icon: const Icon(Icons.add_rounded, size: 18),
                      label: const Text('Add'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: List.generate(glasses, (i) {
                    return WaterGlass(
                      filled: i < filledGlasses,
                      size: 28,
                      onTap: i == filledGlasses || (i == filledGlasses - 1 && i < glasses - 1)
                          ? () => _handleAddWater()
                          : null,
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (e, _) => Text('Error: $e'),
    );
  }

  void _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _showAddMealSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddMealBottomSheet(),
    );
  }

  Future<void> _handleAddWater() async {
    final authUser = ref.read(authStateProvider).valueOrNull;
    if (authUser == null) return;

    final waterLog = WaterLog(
      id: const Uuid().v4(),
      userId: authUser.uid,
      date: DateTime.now(),
      amountMl: 250,
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
}
