import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mark_1/di/di.dart';
import 'package:mark_1/store/appstore.dart';
import 'package:mark_1/ui/components/desktop_nav_bar.dart';
import 'package:mark_1/ui/components/progress_indicator.dart';
import 'package:mark_1/ui/components/theme_switch.dart';
import 'package:mark_1/ui/pages/about/about.dart';
import 'package:mark_1/ui/pages/home/homepage.dart';
import 'package:mark_1/ui/pages/qualifications/qualifications.dart';
import 'package:mark_1/ui/pages/skills/skills.dart';
import 'package:mark_1/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  double screenHeight = 0;
  int currentIndex = 0;
  bool isScrolling = false;
  final store = di<AppStore>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (isScrolling) return;

    double offset = _scrollController.offset;
    int newIndex = (offset / context.screenHeight).round();
    if (newIndex > 1) {
      store.setDestopNavSticky(true);
    }
    store.setCurrentPageIndex(newIndex);
    if (newIndex != currentIndex) {
      currentIndex = newIndex;
      isScrolling = true;
      _scrollToSection(newIndex);
    }
  }

  void _scrollToSection(int index) {
    _scrollController
        .animateTo(
          index * screenHeight,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        )
        .then((_) => isScrolling = false);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: const Column(
            children: [HomePage(), About(), Qualifications(), Skills()],
          ),
        ),
        Positioned(
          left: 16,
          top: context.screenHeight * 0.2,
          child: Observer(
            builder: (context) {
              return VerticalProgressIndicator(
                extent: context.screenHeight * 0.6,
                totaProgressPoints: 5,
                currentProgress: store.currentPageIndex.value,
              );
            },
          ),
        ),
        Observer(
          builder: (context) {
            if (store.makeDesktopNavSticky.value &&
                store.currentPageIndex.value > 1) {
              return Positioned(
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colors.background,
                  ),
                  child: const NavItems(
                    withAnimation: false,
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
        const Positioned(
          left: 16,
          top: 20,
          child: ThemeSwitch(),
        )
      ],
    );
  }
}
