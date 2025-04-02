

import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mark_1/di/di.dart';
import 'package:mark_1/store/appstore.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  ThemeSwitchState createState() => ThemeSwitchState();
}

class ThemeSwitchState extends State<ThemeSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  Future<void> _toggleTheme(AppStore store) async {
    if (isAnimating) return;
    isAnimating = true;
    await _controller.forward(from: 0.0); // Animate the glow effect first
    store.toggleTheme();
    isAnimating = false;
  }

  @override
  Widget build(BuildContext context) {
    final store = di.get<AppStore>();
    final theme = Theme.of(context);
    return Observer(
      builder: (context) {
        bool isLightTheme = store.appTheme.value == ThemeMode.light;

        return GestureDetector(
            onTap: () => _toggleTheme(store),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: theme.size.s16,
              height: theme.size.s8,
              decoration: BoxDecoration(
                color: theme.colors.background,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  // Inner shadow for depth effect
                  BoxShadow(
                    color: isLightTheme ? Colors.white : Colors.black54,
                    offset: const Offset(-4, -4),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: isLightTheme ? Colors.grey[600]! : Colors.black,
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                  ),
                  // Outer glow effect based on theme
                  BoxShadow(
                    // color: theme.colors.primary.withValues(alpha:_glowAnimation.value * 0.6),
                    color: isLightTheme
                        ? Colors.yellow
                            .withValues(alpha: _glowAnimation.value * 0.6)
                        : Colors.blueAccent
                            .withValues(alpha: _glowAnimation.value * 0.6),
                    blurRadius: 30 * _glowAnimation.value,
                    spreadRadius: 10 * _glowAnimation.value,
                  ),
                ],
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  // transitionBuilder: (child, animation) {
                  //   return ScaleTransition(scale: animation, child: child);
                  // },
                  child: isLightTheme
                      ? Icon(Icons.wb_sunny,
                          key: const ValueKey("sun"),
                          size: theme.size.s6,
                          color: Colors.orange)
                      : Icon(Icons.nightlight_round,
                          key: const ValueKey("moon"),
                          size: theme.size.s6,
                          color: Colors.blueAccent),
                ),
              ),
            ));
      },
    );
  }
}
 