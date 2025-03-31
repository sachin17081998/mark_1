import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final AnimationController? controller;

  const FadeInAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.controller,
  });

  @override
  FadeInAnimationState createState() => FadeInAnimationState();
}

class FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = AnimationController(vsync: this, duration: widget.duration);
      _fadeAnimation =
          CurvedAnimation(parent: _controller, curve: Curves.easeIn);
      _controller.forward();
    } else {
      _fadeAnimation =
          CurvedAnimation(parent: widget.controller!, curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _fadeAnimation, child: widget.child);
  }
}
