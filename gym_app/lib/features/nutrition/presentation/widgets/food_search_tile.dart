import 'package:flutter/material.dart';
import '../../domain/entities/food_item.dart';

class FoodSearchTile extends StatelessWidget {
  final FoodItem foodItem;
  final VoidCallback? onTap;

  const FoodSearchTile({
    super.key,
    required this.foodItem,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFF00E676).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.restaurant_rounded,
          color: Color(0xFF00E676),
          size: 22,
        ),
      ),
      title: Text(
        foodItem.name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
      ),
      subtitle: foodItem.brand != null
          ? Text(
              foodItem.brand!,
              style: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
            )
          : null,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${foodItem.calories.toStringAsFixed(0)} cal',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF6D00),
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            'per ${foodItem.servingSizeG.toStringAsFixed(0)}g',
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white54,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
