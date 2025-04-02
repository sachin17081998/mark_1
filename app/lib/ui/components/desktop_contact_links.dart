import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
// import 'package:mark_1/di/di.dart';
// import 'package:mark_1/store/appstore.dart';
import 'package:mark_1/ui/components/vertical_divider.dart';
import 'package:mark_1/utils.dart';

class DesktopContactLinks extends StatelessWidget {
  const DesktopContactLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final store = di<AppStore>();
    return SizedBox(
      height: context.screenHeight * 0.6,
      
      child: Column(
        children: [
          Expanded(
              child:CustomVerticalDivider(
            width: theme.size.s1,
          )),
          SizedBox(
            height: theme.size.s2,
          ),
          Icon(
            Icons.email_rounded,
            size: theme.size.s5,
            color: theme.colors.secondary,
          ),
          SizedBox(
            height: theme.size.s2,
          ),
          Icon(
            Icons.face_2_rounded,
            size: theme.size.s5,
            color: theme.colors.secondary,
          ),
          SizedBox(
            height: theme.size.s2,
          ),
          Icon(
            Icons.settings,
            size: theme.size.s5,
            color: theme.colors.secondary,
          ),
          SizedBox(
            height: theme.size.s2,
          ),
          Icon(
            Icons.email_rounded,
            size: theme.size.s5,
            color: theme.colors.secondary,
          ),
          SizedBox(
            height: theme.size.s2,
          ),
          Expanded(
              child: CustomVerticalDivider(
            width: theme.size.s1,
          ))
        ],
      ),
    );
  }
}
