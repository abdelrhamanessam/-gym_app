import 'package:flutter/material.dart';
import '../../domain/entities/meal_entry.dart';
import '../../domain/entities/meal_food_item.dart';

class MealTile extends StatelessWidget {
  final MealEntry meal;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const MealTile({
    super.key,
    required this.meal,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final mealNames = {
      'breakfast': 'Breakfast',
      'lunch': 'Lunch',
      'dinner': 'Dinner',
      'snack': 'Snack',
    };
    final mealIcons = {
      'breakfast': Icons.free_breakfast_rounded,
      'lunch': Icons.lunch_dining_rounded,
      'dinner': Icons.dinner_dining_rounded,
      'snack': Icons.cookie_rounded,
    };
    final icon = mealIcons[meal.mealType.name] ?? Icons.restaurant_rounded;

    return Card(
      child: ExpansionTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF00E676).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF00E676), size: 22),
        ),
        title: Text(
          mealNames[meal.mealType.name] ?? meal.mealType.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        subtitle: Text(
          '${meal.totalCalories.toStringAsFixed(0)} cal | P: ${meal.totalProtein.toStringAsFixed(0)}g | C: ${meal.totalCarbs.toStringAsFixed(0)}g | F: ${meal.totalFat.toStringAsFixed(0)}g',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onTap != null)
              IconButton(
                icon: const Icon(Icons.edit_outlined, size: 18),
                onPressed: onTap,
              ),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 18,
                    color: Colors.redAccent),
                onPressed: onDelete,
              ),
            const Icon(Icons.expand_more_rounded),
          ],
        ),
        children: meal.foods.map((food) {
          return ListTile(
            dense: true,
            title: Text(
              food.foodItem.name,
              style: const TextStyle(
                fontSize: 13,
                fontFamily: 'Poppins',
              ),
            ),
            subtitle: Text(
              '${food.quantityG.toStringAsFixed(0)}g',
              style: const TextStyle(fontSize: 11, fontFamily: 'Poppins'),
            ),
            trailing: Text(
              '${food.calculatedCalories.toStringAsFixed(0)} cal',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFF6D00),
                fontFamily: 'Poppins',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
