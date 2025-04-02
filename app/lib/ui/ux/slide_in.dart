import 'package:flutter/material.dart';

enum SlideDirection { left, right, up, down }

class SlideInAnimation extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final Duration duration;

  final AnimationController? controller;

  const SlideInAnimation({
    super.key,
    required this.child,
    this.direction = SlideDirection.left,
    this.controller,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  SlideInAnimationState createState() => SlideInAnimationState();
}

class SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    Offset beginOffset;
    switch (widget.direction) {
      case SlideDirection.left:
        beginOffset = const Offset(-1, 0);
        break;
      case SlideDirection.right:
        beginOffset = const Offset(1, 0);
        break;
      case SlideDirection.up:
        beginOffset = const Offset(0, 1);
        break;
      case SlideDirection.down:
        beginOffset = const Offset(0, -1);
        break;
    }
    if (widget.controller == null) {
      _controller = AnimationController(vsync: this, duration: widget.duration);

      _slideAnimation = Tween<Offset>(begin: beginOffset, end: Offset.zero)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _controller.forward();
    } else {
      _slideAnimation =
          Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
        CurvedAnimation(parent: widget.controller!, curve: Curves.easeOut),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _slideAnimation, child: widget.child);
  }
}
