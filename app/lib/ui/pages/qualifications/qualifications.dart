import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:mark_1/utils.dart';

class Qualifications extends StatelessWidget {
  const Qualifications({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        color: Colors.orangeAccent,
        width: context.screenWidth,
        height: context.screenHeight,
        child: Center(
          child: Text(
            'Qualifications',
            style: theme.textStyle.cover,
          ),
        ));
  }
}
