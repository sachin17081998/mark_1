import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mark_1/di/di.dart';
import 'package:mark_1/store/appstore.dart';
import 'package:mark_1/ui/ux/multiple_fadin.dart';
import 'package:mark_1/utils.dart';

class NavItems extends StatelessWidget {
  final bool withAnimation;
  const NavItems({
    super.key,
    this.withAnimation = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final store = di<AppStore>();

    return Observer(
      builder: (context) {
        var children = [
          Text(
            'ABOUT',
            style: theme.textStyle.labelSemiBold
                .copyWith(color: theme.colors.tertiary),
          ),
          SizedBox(
            width: theme.size.s16,
          ),
          Text(
            'SKILLS',
            style: theme.textStyle.labelBold
                .copyWith(color: theme.colors.tertiary),
          ),
          SizedBox(
            width: theme.size.s16,
          ),
          Text(
            'QUALIFICATIONS',
            style: theme.textStyle.labelBold
                .copyWith(color: theme.colors.tertiary),
          ),
          SizedBox(
            width: theme.size.s16,
          ),
          Text(
            'HOBBIES',
            style: theme.textStyle.labelBold
                .copyWith(color: theme.colors.tertiary),
          ),
          SizedBox(
            width: theme.size.s16,
          ),
          Text(
            'PROJECTS',
            style: theme.textStyle.labelBold
                .copyWith(color: theme.colors.tertiary),
          ),
        ];
        if (!withAnimation) {
          return SizedBox(
            width: context.screenWidth,
            child: Padding(
              padding: EdgeInsets.only(bottom: theme.spacing.s24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          );
        }
        return Container(
          width: context.screenWidth,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: theme.spacing.s24),
            child: SequentialFadeIn(
              start: store.startDesktopNavAnimation.value,
              duration: const Duration(milliseconds: 1500),
              // mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        );
      },
    );
  }
}
