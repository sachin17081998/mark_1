import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:mark_1/di/di.dart';
import 'package:mark_1/ui/pages/error.dart';
import 'package:mark_1/ui/pages/mainscree.dart';
import 'package:mark_1/store/appstore.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

void main() async {
  setupStore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final store = di<AppStore>();

    return MaterialApp(
      theme: ThemeData.light().copyWith(
    extensions: [AppText.main()], // Use light theme
  ),
  darkTheme: ThemeData.dark().copyWith(
    extensions: [AppColors.dark(), AppText.main()], // Use dark theme
  ),
  themeMode: ThemeMode.light, // Force light mode
      home: Observer(
        builder: (_) {
         
          // Show loading indicator while initializing
          if (!store.isStoreInitilized.value && store.errorMessage.value == null) {
            return const Scaffold(
              backgroundColor: Colors.red,
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // Show error screen if initialization failed
          if (store.errorMessage.value != null) {
            return ErrorScreen(
              errorMessage: store.errorMessage.value!,
              onRetry: () => store.initializeStore(), // Retry logic
            );
          }

          // Show the main content if everything is loaded
          return const Scaffold(
            body:MainScreen(),
          );
        },
      ),
    );
  }
}

