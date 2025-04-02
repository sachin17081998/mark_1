import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mark_1/utils.dart';

class ParallaxSection extends StatelessWidget {
  final Widget child;
  final double parallaxFactor;

  const ParallaxSection({
    super.key,
    required this.child,
    this.parallaxFactor = 0.5, // Controls the depth of parallax effect
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return NotificationListener<ScrollUpdateNotification>(
            onNotification: (scrollNotification) {
              // Rebuild widget when scrolling for smooth effect
              return true;
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: Scrollable.of(context)!.position,
                    builder: (context, child) {
                      double offset = Scrollable.of(context)!.position.pixels *
                          parallaxFactor;
                      return Transform.translate(
                        offset:
                            Offset(0, offset), // Moves element based on scroll
                        child: child,
                      );
                    },
                    child: child,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
