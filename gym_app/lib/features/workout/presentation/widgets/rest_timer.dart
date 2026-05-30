import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class RestTimer extends StatefulWidget {
  final int initialSeconds;
  final VoidCallback? onComplete;

  const RestTimer({
    super.key,
    this.initialSeconds = 60,
    this.onComplete,
  });

  @override
  RestTimerState createState() => RestTimerState();
}

class RestTimerState extends State<RestTimer>
    with SingleTickerProviderStateMixin {
  late int _remainingSeconds;
  late Timer _timer;
  late AnimationController _animController;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialSeconds;
    _animController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.initialSeconds),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _animController.dispose();
    super.dispose();
  }

  void start() {
    if (_isRunning) return;
    setState(() => _isRunning = true);
    _remainingSeconds = widget.initialSeconds;
    _animController.reset();
    _animController.forward();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds <= 1) {
        _timer.cancel();
        setState(() => _isRunning = false);
        widget.onComplete?.call();
        return;
      }
      setState(() => _remainingSeconds--);
    });
  }

  void stop() {
    _timer.cancel();
    setState(() => _isRunning = false);
  }

  void reset() {
    _timer.cancel();
    setState(() {
      _remainingSeconds = widget.initialSeconds;
      _isRunning = false;
    });
    _animController.reset();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    final timeStr =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    final progress =
        widget.initialSeconds > 0
            ? _remainingSeconds / widget.initialSeconds
            : 0.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _isRunning ? AppColors.primary.withOpacity(0.3) : AppColors.border,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 4,
                  backgroundColor: AppColors.surfaceLight,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _remainingSeconds <= 10
                        ? AppColors.error
                        : AppColors.primary,
                  ),
                ),
                Text(
                  timeStr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: _remainingSeconds <= 10
                        ? AppColors.error
                        : AppColors.primary,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rest Timer',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  _isRunning ? 'Resting...' : 'Ready to go!',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!_isRunning)
                IconButton(
                  onPressed: start,
                  icon: const Icon(Icons.play_circle_filled_rounded),
                  color: AppColors.primary,
                  iconSize: 36,
                ),
              if (_isRunning) ...[
                IconButton(
                  onPressed: stop,
                  icon: const Icon(Icons.pause_circle_filled_rounded),
                  color: AppColors.warning,
                  iconSize: 36,
                ),
                IconButton(
                  onPressed: reset,
                  icon: const Icon(Icons.stop_circle_rounded),
                  color: AppColors.error,
                  iconSize: 36,
                ),
              ],
              IconButton(
                onPressed: () => setState(() {
                  _remainingSeconds += 30;
                }),
                icon: const Icon(Icons.add_circle_outline_rounded),
                color: AppColors.textSecondary,
                iconSize: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
