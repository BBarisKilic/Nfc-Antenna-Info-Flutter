import 'package:flutter/material.dart';

const bool kIsTestEnv = bool.fromEnvironment('FLUTTIUM_TEST');

class PulsingCircle extends StatefulWidget {
  const PulsingCircle({
    super.key,
    this.child,
    this.size,
  });

  final Widget? child;
  final double? size;

  @override
  State<PulsingCircle> createState() => _PulsingCircleState();
}

class _PulsingCircleState extends State<PulsingCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _animation = CurveTween(curve: Curves.easeInOut).animate(_controller);

    if (kIsTestEnv) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.child != null) widget.child!,
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: 1 - _animation.value,
              child: Transform.scale(
                scale: _animation.value,
                child: child,
              ),
            );
          },
          child: SizedBox.square(
            dimension: widget.size ?? 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
