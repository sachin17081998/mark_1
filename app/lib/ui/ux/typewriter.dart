import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final AnimationController? controller;

  const TypewriterText({
    super.key,
    this.controller,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  TypewriterTextState createState() => TypewriterTextState();
}

class TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _charCount;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _charCount = IntTween(begin: 0, end: widget.text.length)
          .animate(widget.controller!);
    } else {
      _controller = AnimationController(vsync: this, duration: widget.duration);
      _charCount =
          IntTween(begin: 0, end: widget.text.length).animate(_controller);
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _charCount,
      builder: (context, child) {
        return Text(
          widget.text.substring(0, _charCount.value),
          style: widget.style,
        );
      },
    );
  }
}
