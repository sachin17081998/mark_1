import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:mark_1/utils.dart';

class VerticalProgressIndicator extends StatelessWidget {
  ///[extent] it will define the progress bar ;ength. suppose you want
  ///track screen scrollling then it will define the screen height
  final double extent;

  ///[totalProgressPoints] it will be used to to define the progress.
  ///suppose your page has 4 section then each scrool will increase the
  ///progress by 25% so totalProgressPoints will be 4.
  final int totaProgressPoints;

  //[currentProgress] it will be used to define the current progress.
  final int currentProgress;
  const VerticalProgressIndicator({
    super.key,
    required this.extent,
    required this.totaProgressPoints,
    required this.currentProgress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          width: theme.size.s2,
          height: context.screenHeight * 0.6,
          color: theme.colors.tertiary,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: theme.size.s2,
          height: (currentProgress / totaProgressPoints) * extent,
          decoration: BoxDecoration(
            color: theme.colors.primary,
            borderRadius: BorderRadius.circular(theme.size.s2),
          ),
        ),
      ],
    );
  }
}
