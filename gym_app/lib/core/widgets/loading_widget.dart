import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoadingWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final double borderRadius;

  const LoadingWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(listenable: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              colors: const [
                AppColors.shimmerBase,
                AppColors.shimmerHighlight,
                AppColors.shimmerBase,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment(-1.0 + _animation.value * 2, 0),
              end: Alignment(1.0 - _animation.value * 2, 0),
            ),
          ),
        );
      },
    );
  }
}

class LoadingCard extends StatelessWidget {
  final int lineCount;
  final bool hasAvatar;

  const LoadingCard({
    super.key,
    this.lineCount = 3,
    this.hasAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasAvatar) ...[
              const LoadingWidget(width: 48, height: 48, borderRadius: 24),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  lineCount,
                  (i) => Padding(
                    padding: EdgeInsets.only(bottom: i < lineCount - 1 ? 8 : 0),
                    child: LoadingWidget(
                      height: 14,
                      width: i == lineCount - 1 ? 0.6 : 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  final int itemCount;

  const LoadingScreen({super.key, this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: itemCount,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: LoadingCard(),
      ),
    );
  }
}

