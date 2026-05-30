import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class XpFlyout extends StatefulWidget {
  final int amount;
  final String reason;
  final Widget child;

  const XpFlyout({
    super.key,
    required this.amount,
    required this.reason,
    required this.child,
  });

  @override
  State<XpFlyout> createState() => _XpFlyoutState();
}

class _XpFlyoutState extends State<XpFlyout>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  bool _showFlyout = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _offsetAnimation = Tween<double>(begin: 0, end: -60).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void trigger() {
    if (!_controller.isCompleted) {
      _controller.forward(from: 0);
    } else {
      _controller.reset();
      _controller.forward();
    }
    setState(() => _showFlyout = true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: trigger,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.child,
          if (_showFlyout)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  top: _offsetAnimation.value,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: Text(
                      '+${widget.amount} XP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        fontFamily: 'Poppins',
                        shadows: [
                          Shadow(
                            color: AppColors.primary.withOpacity(0.5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class AnimatedBuilder extends AnimatedWidget {
  final Widget Function(BuildContext context, Widget? child) builder;

  const AnimatedBuilder({
    super.key,
    required super.listenable,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context, null);
  }
}
