import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';
import 'theme.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    _initDeviceToken();
  }

  Future<void> _initDeviceToken() async {
    final deviceTokenProvider = StateProvider<String?>((ref) => null);
    final token = await FirebaseMessaging.instance.getToken();
    ref.read(deviceTokenProvider.notifier).state = token;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Web Reserve AC',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}