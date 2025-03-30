import 'dart:async';
import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';
import 'package:mark_1/api/api.dart';

import 'package:sanity_service/sanity_client.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
       SanityService.instance.initialize(
        projectId: const String.fromEnvironment('PROJECT_ID'),
        apiVersion: const String.fromEnvironment('API_VERSION'),
        dataset: const String.fromEnvironment('DATA_SET'),
        token: const String.fromEnvironment('TOKEN'));
    Api.fetchAbout();
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(extensions: [AppColors.dark(), AppText.main()]),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text('hii'),
        ),
      ),
    );
  }
}


/*

  Future<void> fetchSinglePost() async {
    const query = '*[_type == "about"]';

    try {
      final post = await SanityService.instance.fetchSingleDocument<Post>(
        query: query,
        fromJson: (json) => Post.fromJson(json),
      );

      if (post != null) {
        print('Title: ${post.title}, Body: ${post.body}');
      } else {
        print('No document found.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  

     SanityService.instance.initialize(
        projectId: const String.fromEnvironment('PROJECT_ID'),
        apiVersion: const String.fromEnvironment('API_VERSION'),
        dataset: const String.fromEnvironment('DATA_SET'),
        token: const String.fromEnvironment('TOKEN'));
   */

