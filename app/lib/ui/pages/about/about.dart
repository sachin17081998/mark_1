import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:mark_1/utils.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        color: Colors.white,
        width: context.screenWidth,
        height: context.screenHeight,
        child: Center(
          child: Text(
            'About',
            style: theme.textStyle.cover,
          ),
        ));
  }
}
