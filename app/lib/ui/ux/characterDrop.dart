import 'package:flutter/material.dart';

class CharacterDropText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Duration delay;

  final AnimationController? controller;

  const CharacterDropText(
      {super.key,
      required this.text,
      this.style,
      this.controller,
      this.delay = const Duration(milliseconds: 50)});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(text.length, (index) {
        return DelayedDropCharacter(
          character: text[index],
          delay: Duration(milliseconds: delay.inMilliseconds * index),
          style: style,
          controller: controller,
        );
      }),
    );
  }
}

class DelayedDropCharacter extends StatefulWidget {
  final String character;
  final TextStyle? style;
  final Duration delay;

  final AnimationController? controller;

  const DelayedDropCharacter(
      {super.key,
      this.controller,
      required this.character,
      this.style,
      required this.delay});

  @override
  DelayedDropCharacterState createState() => DelayedDropCharacterState();
}

class DelayedDropCharacterState extends State<DelayedDropCharacter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _dropAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));
    }
    _dropAnimation = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    Future.delayed(widget.delay, () {
      if (mounted && widget.controller == null) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _dropAnimation,
      child: Text(widget.character, style: widget.style),
    );
  }
}
