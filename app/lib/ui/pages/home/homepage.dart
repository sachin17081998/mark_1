import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:mark_1/ui/pages/home/desktop_home_page.dart';
import 'package:mark_1/ui/pages/home/mobileHomePage.dart';
import 'package:mark_1/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: context.screenWidth,
      height: context.screenHeight,
      color: theme.colors.background,
      child:
          context.isDesktop ? const DesktopHomePage() : const MobileHomePage(),
    );
  }
}
