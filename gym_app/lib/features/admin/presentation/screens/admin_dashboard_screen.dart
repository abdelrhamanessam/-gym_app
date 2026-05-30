import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/admin_providers.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(adminUsersProvider);
    final foodAsync = ref.watch(adminFoodDatabaseProvider);
    final workoutsAsync = ref.watch(adminWorkoutProgramsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.accent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Admin Panel',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Manage your fitness app',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            usersAsync.when(
              data: (users) => _dashboardCard(
                context,
                icon: Icons.people_rounded,
                title: 'Manage Users',
                subtitle: '${users.length} total users',
                color: AppColors.info,
                onTap: () {},
              ),
              loading: () => _dashboardCard(
                context,
                icon: Icons.people_rounded,
                title: 'Manage Users',
                subtitle: 'Loading...',
                color: AppColors.info,
                onTap: null,
              ),
              error: (e, _) => _dashboardCard(
                context,
                icon: Icons.people_rounded,
                title: 'Manage Users',
                subtitle: 'Error loading',
                color: AppColors.error,
                onTap: null,
              ),
            ),
            const SizedBox(height: 8),
            foodAsync.when(
              data: (food) => _dashboardCard(
                context,
                icon: Icons.restaurant_menu_rounded,
                title: 'Food Database',
                subtitle: '${food.length} items',
                color: AppColors.warning,
                onTap: () {},
              ),
              loading: () => _dashboardCard(
                context,
                icon: Icons.restaurant_menu_rounded,
                title: 'Food Database',
                subtitle: 'Loading...',
                color: AppColors.warning,
                onTap: null,
              ),
              error: (e, _) => _dashboardCard(
                context,
                icon: Icons.restaurant_menu_rounded,
                title: 'Food Database',
                subtitle: 'Error loading',
                color: AppColors.error,
                onTap: null,
              ),
            ),
            const SizedBox(height: 8),
            workoutsAsync.when(
              data: (workouts) => _dashboardCard(
                context,
                icon: Icons.fitness_center_rounded,
                title: 'Workout Programs',
                subtitle: '${workouts.length} programs',
                color: AppColors.primary,
                onTap: () {},
              ),
              loading: () => _dashboardCard(
                context,
                icon: Icons.fitness_center_rounded,
                title: 'Workout Programs',
                subtitle: 'Loading...',
                color: AppColors.primary,
                onTap: null,
              ),
              error: (e, _) => _dashboardCard(
                context,
                icon: Icons.fitness_center_rounded,
                title: 'Workout Programs',
                subtitle: 'Error loading',
                color: AppColors.error,
                onTap: null,
              ),
            ),
            const SizedBox(height: 8),
            _dashboardCard(
              context,
              icon: Icons.notifications_rounded,
              title: 'Send Notification',
              subtitle: 'Broadcast to users',
              color: AppColors.secondary,
              onTap: () {},
            ),
            const SizedBox(height: 8),
            _dashboardCard(
              context,
              icon: Icons.analytics_rounded,
              title: 'App Analytics',
              subtitle: 'View platform metrics',
              color: AppColors.accent,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
