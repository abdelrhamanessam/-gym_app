import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/meal_entry.dart';
import '../providers/nutrition_providers.dart';

class MealDetailScreen extends ConsumerWidget {
  final String mealId;

  const MealDetailScreen({super.key, required this.mealId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsAsync = ref.watch(mealsForDateProvider(date: DateTime.now()));

    return mealsAsync.when(
      data: (meals) {
        final meal = meals.where((m) => m.id == mealId).firstOrNull;
        if (meal == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Meal Details')),
            body: const Center(child: Text('Meal not found')),
          );
        }
        return _MealDetailContent(meal: meal);
      },
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Meal Details')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(title: const Text('Meal Details')),
        body: Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _MealDetailContent extends StatelessWidget {
  final MealEntry meal;

  const _MealDetailContent({required this.meal});

  @override
  Widget build(BuildContext context) {
    final mealNames = {
      'breakfast': 'Breakfast',
      'lunch': 'Lunch',
      'dinner': 'Dinner',
      'snack': 'Snack',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(mealNames[meal.mealType.name] ?? 'Meal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () {
              // TODO: Delete meal
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Total Nutrition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _nutrientCircle(
                            'Calories',
                            meal.totalCalories.toStringAsFixed(0),
                            const Color(0xFFFF6D00)),
                        _nutrientCircle(
                            'Protein',
                            '${meal.totalProtein.toStringAsFixed(0)}g',
                            const Color(0xFF40C4FF)),
                        _nutrientCircle(
                            'Carbs',
                            '${meal.totalCarbs.toStringAsFixed(0)}g',
                            const Color(0xFFCE93D8)),
                        _nutrientCircle(
                            'Fat',
                            '${meal.totalFat.toStringAsFixed(0)}g',
                            const Color(0xFFEF5350)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (meal.imageUrl != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(meal.imageUrl!,
                    height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
            ],
            if (meal.notes != null && meal.notes!.isNotEmpty) ...[
              const Text(
                'Notes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  meal.notes!,
                  style: const TextStyle(fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(height: 16),
            ],
            const Text(
              'Food Items',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            ...meal.foods.map((food) => Card(
                  child: ListTile(
                    title: Text(food.foodItem.name,
                        style: const TextStyle(fontFamily: 'Poppins')),
                    subtitle: Text('${food.quantityG.toStringAsFixed(0)}g',
                        style: const TextStyle(fontFamily: 'Poppins')),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${food.calculatedCalories.toStringAsFixed(0)} cal',
                          style: const TextStyle(
                            color: Color(0xFFFF6D00),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          'P: ${food.calculatedProtein.toStringAsFixed(0)}g C: ${food.calculatedCarbs.toStringAsFixed(0)}g F: ${food.calculatedFat.toStringAsFixed(0)}g',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white54,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _nutrientCircle(String label, String value, Color color) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.1),
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: color,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
