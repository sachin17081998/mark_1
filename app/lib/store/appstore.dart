import 'package:flutter/material.dart';
import 'package:mark_1/api/api.dart';
import 'package:mark_1/api/models/about.dart';
import 'package:mobx/mobx.dart';
import 'package:sanity_service/sanity_client.dart';

class AppStore {
  AppStore() {
    // Initialize any necessary data or services here
    // For example, you can initialize a database connection or an API client
    initializeStore();
  }

//App related observers
  Observable<bool> isStoreInitilized = Observable(false);
  Observable<String?> errorMessage = Observable(null);
  Observable<ThemeMode> appTheme = Observable(ThemeMode.light);

//Page related observers
  Observable<About?> aboutData = Observable(null);

//componenet related observables
  Observable<int> currentPageIndex = Observable(0);
  Observable<bool> makeDesktopNavSticky = Observable(false);

  Observable<bool> startDesktopNavAnimation = Observable(false);

  void setStoreInitilization(bool value) {
    runInAction(() {
      isStoreInitilized.value = value;
    });
  }

  void setErrorMessage(String? value) {
    runInAction(() {
      errorMessage.value = value;
    });
  }

  void setAboutData(About? value) {
    runInAction(() {
      aboutData.value = value;
    });
  }

  void setCurrentPageIndex(int value) {
    runInAction(() {
      currentPageIndex.value = value;
    });
  }

  void setDestopNavSticky(bool value) {
    runInAction(() {
      makeDesktopNavSticky.value = value;
    });
  }

  void triggerDesktopNavAnimation(bool value) {
    runInAction(() {
      startDesktopNavAnimation.value = value;
    });
  }

  void toggleTheme() {
    runInAction(() {
      if (appTheme.value == ThemeMode.light) {
        appTheme.value = ThemeMode.dark;
      } else {
        appTheme.value = ThemeMode.light;
      }
    });
  }

  Future<void> initializeStore() async {
    try {
      _initializeSanity();
      final about = await Api.fetchAbout();
      setAboutData(about);
      setStoreInitilization(true);
      setErrorMessage(null);
    } catch (e) {
      debugPrint('[Mark_1][AppStore] Error: $e');
      setErrorMessage('Unable to launcg the App');
      setStoreInitilization(false);
    }
  }

  void _initializeSanity() {
    SanityService.instance.initialize(
      projectId: const String.fromEnvironment('PROJECT_ID'),
      apiVersion: const String.fromEnvironment('API_VERSION'),
      dataset: const String.fromEnvironment('DATA_SET'),
      token: const String.fromEnvironment('TOKEN'),
    );
  }
}
