import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/profile_screen.dart';
import '../features/auth/presentation/providers/auth_providers.dart';
import '../features/nutrition/presentation/screens/nutrition_dashboard_screen.dart';
import '../features/nutrition/presentation/screens/food_search_screen.dart';
import '../features/nutrition/presentation/screens/add_meal_screen.dart';
import '../features/nutrition/presentation/screens/meal_detail_screen.dart';
import '../features/nutrition/presentation/screens/water_tracker_screen.dart';
import '../features/nutrition/presentation/screens/food_database_screen.dart';
import '../features/nutrition/presentation/screens/meal_templates_screen.dart';
import '../features/workout/presentation/screens/workout_list_screen.dart';
import '../features/workout/presentation/screens/active_workout_screen.dart';
import '../features/workout/presentation/screens/workout_detail_screen.dart';
import '../features/workout/presentation/screens/workout_templates_screen.dart';
import '../features/workout/presentation/screens/exercise_library_screen.dart';
import '../features/workout/presentation/screens/exercise_detail_screen.dart';
import '../features/progress/presentation/screens/progress_screen.dart';
import '../features/progress/presentation/screens/add_measurement_screen.dart';
import '../features/progress/presentation/screens/body_goals_screen.dart';
import '../features/progress/presentation/screens/progress_photos_screen.dart';
import '../features/analytics/presentation/screens/analytics_screen.dart';
import '../features/analytics/presentation/screens/goal_prediction_screen.dart';
import '../features/ai_coach/presentation/screens/ai_coach_screen.dart';
import '../features/ai_coach/presentation/screens/daily_summary_screen.dart';
import '../features/gamification/presentation/screens/gamification_screen.dart';
import '../features/gamification/presentation/screens/achievements_screen.dart';
import '../features/admin/presentation/screens/admin_dashboard_screen.dart';
import '../features/admin/presentation/screens/admin_users_screen.dart';
import '../features/admin/presentation/screens/admin_food_database_screen.dart';
import '../features/admin/presentation/screens/admin_notifications_screen.dart';
import '../features/admin/presentation/screens/admin_workout_screen.dart';
import '../features/more/presentation/screens/more_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authStateAsync = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authStateAsync.valueOrNull != null;
      final isAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/forgot-password';

      if (!isLoggedIn && !isAuthRoute) {
        return '/login';
      }
      if (isLoggedIn && isAuthRoute) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: 'dashboard',
                builder: (context, state) => const AnalyticsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/nutrition',
                name: 'nutrition',
                builder: (context, state) => const NutritionDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/workout',
                name: 'workout',
                builder: (context, state) => const WorkoutListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/progress',
                name: 'progress',
                builder: (context, state) => const ProgressScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/more',
                name: 'more',
                builder: (context, state) => const MoreScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/nutrition/search',
        name: 'nutritionSearch',
        builder: (context, state) => const FoodSearchScreen(),
      ),
      GoRoute(
        path: '/nutrition/add',
        name: 'nutritionAdd',
        builder: (context, state) => const AddMealScreen(),
      ),
      GoRoute(
        path: '/nutrition/meal/:id',
        name: 'mealDetail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return MealDetailScreen(mealId: id);
        },
      ),
      GoRoute(
        path: '/nutrition/water',
        name: 'waterTracker',
        builder: (context, state) => const WaterTrackerScreen(),
      ),
      GoRoute(
        path: '/nutrition/database',
        name: 'foodDatabase',
        builder: (context, state) => const FoodDatabaseScreen(),
      ),
      GoRoute(
        path: '/nutrition/templates',
        name: 'mealTemplates',
        builder: (context, state) => const MealTemplatesScreen(),
      ),
      GoRoute(
        path: '/workout/detail/:id',
        name: 'workoutDetail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return WorkoutDetailScreen(id: id);
        },
      ),
      GoRoute(
        path: '/workout/create',
        name: 'workoutCreate',
        builder: (context, state) => const ActiveWorkoutScreen(),
      ),
      GoRoute(
        path: '/workout/exercises',
        name: 'exerciseLibrary',
        builder: (context, state) => const ExerciseLibraryScreen(),
      ),
      GoRoute(
        path: '/exercise/:id',
        name: 'exerciseDetail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ExerciseDetailScreen(id: id);
        },
      ),
      GoRoute(
        path: '/progress/add',
        name: 'addMeasurement',
        builder: (context, state) => const AddMeasurementScreen(),
      ),
      GoRoute(
        path: '/progress/goals',
        name: 'bodyGoals',
        builder: (context, state) => const BodyGoalsScreen(),
      ),
      GoRoute(
        path: '/progress/photos',
        name: 'progressPhotos',
        builder: (context, state) => const ProgressPhotosScreen(),
      ),
      GoRoute(
        path: '/analytics',
        name: 'analytics',
        builder: (context, state) => const AnalyticsScreen(),
      ),
      GoRoute(
        path: '/analytics/goal-prediction',
        name: 'goalPrediction',
        builder: (context, state) => const GoalPredictionScreen(),
      ),
      GoRoute(
        path: '/ai-coach',
        name: 'aiCoach',
        builder: (context, state) {
          final userId = ref.watch(authStateProvider).valueOrNull?.uid ?? '';
          return AiCoachScreen(userId: userId);
        },
      ),
      GoRoute(
        path: '/daily-summary',
        name: 'dailySummary',
        builder: (context, state) {
          final userId = ref.watch(authStateProvider).valueOrNull?.uid ?? '';
          return DailySummaryScreen(userId: userId, date: DateTime.now());
        },
      ),
      GoRoute(
        path: '/gamification',
        name: 'gamification',
        builder: (context, state) => GamificationScreen(userId: ''),
      ),
      GoRoute(
        path: '/achievements',
        name: 'achievements',
        builder: (context, state) => AchievementsScreen(userId: ''),
      ),
      GoRoute(
        path: '/admin',
        name: 'admin',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        path: '/admin/users',
        name: 'adminUsers',
        builder: (context, state) => const AdminUsersScreen(),
      ),
      GoRoute(
        path: '/admin/food-database',
        name: 'adminFoodDB',
        builder: (context, state) => const AdminFoodDatabaseScreen(),
      ),
      GoRoute(
        path: '/admin/notifications',
        name: 'adminNotifications',
        builder: (context, state) => const AdminNotificationsScreen(),
      ),
      GoRoute(
        path: '/admin/workouts',
        name: 'adminWorkouts',
        builder: (context, state) => const AdminWorkoutScreen(),
      ),
    ],
  );
}

class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFF2A2A2A),
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              activeIcon: Icon(Icons.dashboard_rounded),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu_rounded),
              activeIcon: Icon(Icons.restaurant_menu_rounded),
              label: 'Nutrition',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_rounded),
              activeIcon: Icon(Icons.fitness_center_rounded),
              label: 'Workout',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up_rounded),
              activeIcon: Icon(Icons.trending_up_rounded),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded),
              activeIcon: Icon(Icons.more_horiz_rounded),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
