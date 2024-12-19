import 'dart:async';

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
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        backgroundColor: Colors.black,
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
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: onTap,
            child: isLoading
                ? const CircularProgressIndicator(
                    backgroundColor: Colors.blueAccent,
                    valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                    strokeWidth: 10,
                  )
                : const Text(
                    'Open Wikepedia',
                    style: TextStyle(color: Colors.black),
                  ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          isLoading ? 'Wikipedia is Open' : 'Wikepedia is closed',
          style: const TextStyle(color: Colors.amberAccent),
        ),
      ],
    );
  }
}
