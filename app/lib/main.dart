import 'dart:async';
import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(extensions: [AppColors.dark(), AppText.main()]),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: TestButton(),
        ),
      ),
    );
  }
}

class TestButton extends StatefulWidget {
  const TestButton({super.key});

  @override
  State<TestButton> createState() => _TestButtonState();
}

class _TestButtonState extends State<TestButton> {
  bool isLoading = false;
  late html.WindowBase window;

  void onTap() {
    setState(() {
      isLoading = true;
    });
    final window = html.window.open('https://www.wikipedia.org/', '_blank');

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (window.closed!) {
        setState(() {
          isLoading = false;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extensions = theme.extensions;

    print("Extensions in ThemeData: ${theme.textStyle.special}");
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        SizedBox(
          height: theme.size.s16,
          width: 200,
          child: ElevatedButton(
            onPressed: onTap,
            child: isLoading
                ? const CircularProgressIndicator(
                    backgroundColor: Colors.blueAccent,
                    valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
                    strokeWidth: 10,
                  )
                : const Text(
                    'Open Wikepedia',
                    style: TextStyle(color: Colors.black),
                  ),
          ),
        ),
        SizedBox(
          height: theme.spacing.s1,
        ),
        Text(
          isLoading ? 'Wikipedia is Open' : 'Wikepedia is closed',
          style: theme.textStyle.special,
        ),
        Text(
          'Hello, World!',
          style: theme.textStyle.special,
        ),
        Text(
          'Hello, World!',
          style: theme.textStyle.specialLargeBold,
        ),
        Text(
          'Hello, World!',
          style: theme.textStyle.specialMediumSemiBold,
        ),
        Text(
          'Hello, World!',
          style: theme.textStyle.display,
        ),
        Text(
          'Hello, World!',
          style: theme.textStyle.headline,
        ),
        Text(
          'Hello, World!',
          style: theme.textStyle.title,
        ),
        Text(
          'Hello, World!',
          style: theme.textStyle.body,
        ),
        Text(
          'Hello, World!',
          style: theme.textStyle.label,
        ),
      ],
    );
  }
}
