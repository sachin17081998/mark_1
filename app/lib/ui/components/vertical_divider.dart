import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final double width;
  const CustomVerticalDivider({required this.width,super.key});

  @override
  Widget build(BuildContext context) {
   final theme=Theme.of(context);
    return Container(
      width: width,
   height:double.infinity,
      color: theme.colors.tertiary,
    );
  }
}