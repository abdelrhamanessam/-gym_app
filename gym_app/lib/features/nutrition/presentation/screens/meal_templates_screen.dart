import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/meal_entry.dart';
import '../../domain/entities/meal_template.dart';
import '../providers/nutrition_providers.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

class MealTemplatesScreen extends ConsumerWidget {
  const MealTemplatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(mealTemplatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Templates'),
      ),
      body: templatesAsync.when(
        data: (templates) {
          if (templates.isEmpty) {
            return const Center(
              child: Text(
                'No saved templates',
                style: TextStyle(color: Colors.white54, fontFamily: 'Poppins'),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final template = templates[index];
              return Card(
                child: ListTile(
                  leading: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00E676).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.bookmark_rounded,
                        color: Color(0xFF00E676), size: 22),
                  ),
                  title: Text(
                    template.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  subtitle: Text(
                    '${template.foods.length} items | ${template.totalCalories.toStringAsFixed(0)} cal',
                    style: const TextStyle(fontFamily: 'Poppins'),
                  ),
                  trailing: const Icon(Icons.add_rounded,
                      color: Color(0xFF00E676)),
                  onTap: () => _useTemplate(context, ref, template),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Future<void> _useTemplate(
      BuildContext context, WidgetRef ref, MealTemplate template) async {
    final authUser = ref.read(authStateProvider).valueOrNull;
    if (authUser == null) return;

    // TODO: Convert template to meal entries for today
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added "${template.name}" to today\'s log')),
    );
  }
}
