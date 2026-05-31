import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/utils/date_utils.dart';
import '../providers/ai_coach_providers.dart';
import '../../data/repositories/ai_coach_repository_impl.dart';
import '../widgets/ai_chat_bubble.dart';

class AiCoachScreen extends ConsumerStatefulWidget {
  final String userId;

  const AiCoachScreen({super.key, required this.userId});

  @override
  ConsumerState<AiCoachScreen> createState() => _AiCoachScreenState();
}

class _AiCoachScreenState extends ConsumerState<AiCoachScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  bool _isThinking = false;

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    ref.read(aiCoachMessageProvider.notifier).addMessage('user', message);
    _textController.clear();
    _scrollToBottom();

    setState(() => _isThinking = true);
    _scrollToBottom();

    try {
      final repo = ref.read(aiCoachRepositoryProvider);
      String response;

      if (message.toLowerCase().contains('nutrition')) {
        response = await repo.getNutritionAdvice([], {});
      } else if (message.toLowerCase().contains('progress') ||
          message.toLowerCase().contains('workout')) {
        response = await repo.getFitnessAdvice([], {});
      } else {
        response = "I'm here to help with your fitness journey! "
            "Try asking about nutrition, workouts, or your overall progress.";
      }

      ref.read(aiCoachMessageProvider.notifier).addMessage('assistant', response);
    } catch (e) {
      ref.read(aiCoachMessageProvider.notifier).addMessage(
        'assistant',
        "I'm having trouble connecting right now. Please try again later.",
      );
    }

    setState(() => _isThinking = false);
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(aiCoachMessageProvider);
    final today = DateTime.now();
    final summaryAsync = ref.watch(
      dailySummaryReportProvider(widget.userId, today),
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.accent],
                ),
              ),
              child: const Center(
                child: Icon(Icons.auto_awesome_rounded, size: 16, color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            const Text('AI Coach'),
          ],
        ),
      ),
      body: Column(
        children: [
          summaryAsync.when(
            data: (summary) => Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A1A2E), Color(0xFF232340)],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.summarize_rounded, color: AppColors.primary, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateUtilsExt.formatDate(summary.date),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${summary.caloriesConsumed}/${summary.caloriesTarget} kcal',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View'),
                  ),
                ],
              ),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          Expanded(
            child: messages.isEmpty
                ? _buildQuickActions()
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: messages.length + (_isThinking ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length && _isThinking) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: AiTypingIndicator(),
                        );
                      }
                      final msg = messages[index];
                      return AiChatBubble(
                        message: msg['content'] as String? ?? '',
                        isUser: msg['role'] == 'user',
                        timestamp: msg['timestamp'] != null
                            ? DateUtilsExt.timeAgo(
                                DateTime.parse(msg['timestamp'] as String),
                              )
                            : null,
                      );
                    },
                  ),
          ),
          if (messages.isEmpty) const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.surface,
              border: Border(
                top: BorderSide(color: AppColors.divider),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Ask AI Coach...',
                        hintStyle: const TextStyle(
                          color: AppColors.textHint,
                          fontFamily: 'Poppins',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.surfaceLight,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.accent],
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send_rounded, color: Colors.white),
                      onPressed: () => _sendMessage(_textController.text),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.restaurant_rounded, 'label': 'Analyze my nutrition today', 'color': AppColors.warning},
      {'icon': Icons.trending_up_rounded, 'label': "How's my progress?", 'color': AppColors.primary},
      {'icon': Icons.fitness_center_rounded, 'label': 'Give me workout tips', 'color': AppColors.info},
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.accent],
              ),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your AI Fitness Coach',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Ask me anything about your fitness journey',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 24),
          ...actions.map((action) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _sendMessage(action['label'] as String),
                    icon: Icon(
                      action['icon'] as IconData,
                      color: action['color'] as Color,
                      size: 20,
                    ),
                    label: Text(
                      action['label'] as String,
                      style: TextStyle(
                        color: action['color'] as Color,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: (action['color'] as Color).withOpacity(0.3),
                      ),
                      backgroundColor: (action['color'] as Color).withOpacity(0.05),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
