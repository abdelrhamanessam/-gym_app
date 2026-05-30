import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authStateProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          if (authUser != null)
            _buildMenuItem(
              context,
              icon: Icons.person_rounded,
              title: 'Profile',
              subtitle: authUser.displayName ?? authUser.email,
              onTap: () => context.push('/profile'),
            ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            icon: Icons.auto_awesome_rounded,
            title: 'AI Coach',
            subtitle: 'Personalized nutrition & fitness advice',
            color: AppColors.primary,
            onTap: () => context.push('/ai-coach'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.summarize_rounded,
            title: 'Daily Summary',
            subtitle: 'Today\'s nutrition & workout report',
            color: AppColors.accent,
            onTap: () => context.push('/daily-summary'),
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            icon: Icons.sports_esports_rounded,
            title: 'Gamification',
            subtitle: 'XP, levels & achievements',
            color: Colors.amber,
            onTap: () => context.push('/gamification'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.emoji_events_rounded,
            title: 'Achievements',
            subtitle: 'View your unlocked badges',
            color: Colors.orange,
            onTap: () => context.push('/achievements'),
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            icon: Icons.analytics_rounded,
            title: 'Analytics',
            subtitle: 'Charts, trends & goal prediction',
            color: AppColors.info,
            onTap: () => context.push('/analytics'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.track_changes_rounded,
            title: 'Goal Prediction',
            subtitle: 'Estimated completion timeline',
            color: AppColors.warning,
            onTap: () => context.push('/analytics/goal-prediction'),
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            icon: Icons.admin_panel_settings_rounded,
            title: 'Admin',
            subtitle: 'Manage app data',
            color: Colors.redAccent,
            onTap: () => context.push('/admin'),
          ),
          const Divider(height: 1),
          _buildMenuItem(
            context,
            icon: Icons.logout_rounded,
            title: 'Sign Out',
            subtitle: '',
            color: Colors.red,
            onTap: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Sign Out'),
                  content: const Text('Are you sure you want to sign out?'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                    TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Sign Out')),
                  ],
                ),
              );
              if (confirmed == true) {
                await ref.read(signOutActionProvider.future);
                if (context.mounted) context.go('/login');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    Color? color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: (color ?? Colors.grey).withOpacity(0.15),
        child: Icon(icon, color: color ?? Colors.grey, size: 22),
      ),
      title: Text(title, style: const TextStyle(fontFamily: 'Poppins')),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle, style: const TextStyle(fontSize: 12, fontFamily: 'Poppins'))
          : null,
      trailing: const Icon(Icons.chevron_right_rounded, color: Colors.white38),
      onTap: onTap,
    );
  }
}
