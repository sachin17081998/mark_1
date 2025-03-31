import 'package:flutter/material.dart';

class SequentialPopIn extends StatefulWidget {
  final List<Widget> children;
  final Duration delay;
  final Duration duration;
  final bool start; // New parameter to control animation

  const SequentialPopIn({
    required this.children,
    this.delay = const Duration(milliseconds: 300),
    this.duration = const Duration(milliseconds: 500),
    this.start = true, // Default to start immediately
    super.key,
  });

  @override
  SequentialPopInState createState() => SequentialPopInState();
}

class SequentialPopInState extends State<SequentialPopIn>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    if (widget.start) {
      _triggerAnimations();
    }
  }

  void _initializeAnimations() {
    _controllers = List.generate(
      widget.children.length,
      (index) => AnimationController(
        vsync: this,
        duration: widget.duration,
      ),
    );

    _animations = _controllers.map((controller) {
      return CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      );
    }).toList();
  }

  @override
  void didUpdateWidget(covariant SequentialPopIn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.start != oldWidget.start) {
      if (widget.start) {
        _triggerAnimations();
      } else {
        _resetAnimations();
      }
    }
  }

  void _triggerAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      await Future.delayed(widget.delay);
      _controllers[i].forward();
    }
  }

  void _resetAnimations() {
    for (var controller in _controllers) {
      controller.reset();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.children.length, (index) {
        return FadeTransition(
          opacity: _animations[index],
          child: ScaleTransition(
            scale: _animations[index],
            child: widget.children[index],
          ),
        );
      }),
    );
  }
}
