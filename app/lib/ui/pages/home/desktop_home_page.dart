import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:mark_1/di/di.dart';
import 'package:mark_1/store/appstore.dart';
import 'package:mark_1/ui/components/desktop_contact_links.dart';
import 'package:mark_1/ui/components/desktop_nav_bar.dart';
import 'package:mark_1/ui/ux/fadein.dart';
import 'package:mark_1/ui/ux/parallax.dart';
import 'package:mark_1/ui/ux/typewriter.dart';
import 'package:mark_1/utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage>
    with TickerProviderStateMixin {
  late AnimationController _titleController, _imageController;
  bool startMenuAnimation = false;
  final store = di<AppStore>();
  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _imageController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    // _titleController.forward();
    // _titleController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) _imageController.forward();
    // });

    // _imageController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     store.triggerDesktopNavAnimation(true);
    //   }
    // });
    _imageController.forward();
    _imageController.addStatusListener((status) {
      if (status == AnimationStatus.completed) _titleController.forward();
    });

    _titleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        store.triggerDesktopNavAnimation(true);
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = di<AppStore>();
    final theme = Theme.of(context);
    return Container(
      child: Stack(
        children: [
          ParallaxSection(
            parallaxFactor: 0.3,
            child: Align(
                alignment: Alignment.topCenter,
                child: TypewriterText(
                    controller: _titleController,
                    text: store.aboutData.value!.firstName,
                    style: theme.textStyle.cover
                        .copyWith(color: theme.colors.primary))

                //     FadeInAnimation(
                //   // duration: const Duration(milliseconds: 2000),
                //   controller: _titleController,
                //   child: Text(
                //     store.aboutData.value!.firstName,
                //     style: theme.textStyle.cover
                //         .copyWith(color: theme.colors.primary),
                //   ),
                // )
                ),
          ),
          Positioned.fill(
            child: ParallaxSection(
              parallaxFactor: 0.4,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.25, 1],
                    colors: [
                      theme.colors.background,
                      theme.colors.background.withAlpha(0)
                    ],
                  ),
                ),
              ),
            ),
          ),
          ParallaxSection(
            parallaxFactor: 0.5,
            child: Align(
              child: FadeInAnimation(
                controller: _imageController,
                // direction: SlideDirection.up,
                // duration: const Duration(milliseconds: 1500),
                child: Image.network(
                  sanityImageUrl(store.aboutData.value!.coverImage.asset.ref),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.1, 1],
                  colors: [
                    theme.colors.background,
                    theme.colors.background.withAlpha(0)
                  ],
                ),
              ),
            ),
          ),

          // progress bar
          Positioned(
            bottom: 50,
            child: VisibilityDetector(
                onVisibilityChanged: (info) async {
                  print(info.visibleFraction);
                  if (info.visibleFraction < 1) {
                    await Future.delayed(const Duration(milliseconds: 100));
                    store.setDestopNavSticky(true);
                  }
                  if (info.visibleFraction > 0.1) {
                    await Future.delayed(const Duration(milliseconds: 100));
                    store.setDestopNavSticky(false);
                  }
                },
                key: UniqueKey(),
                child: const NavItems()),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: theme.spacing.s32),
                child: const DesktopContactLinks(),
              ))
        ],
      ),
    );
  }
}
