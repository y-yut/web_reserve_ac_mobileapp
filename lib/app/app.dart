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
    // 通知許可をリクエスト
    await FirebaseMessaging.instance.requestPermission();

    // APNsトークンがセットされるまで待つ
    String? apnsToken;
    int retry = 0;
    while (apnsToken == null && retry < 10) {
      apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken == null) {
        await Future.delayed(const Duration(seconds: 1));
        retry++;
      }
    }

    // FCMトークンを取得
    final token = await FirebaseMessaging.instance.getToken();

    // Providerで管理する場合は、グローバルなProviderを使ってください
    // ref.read(deviceTokenProvider.notifier).state = token;
    print('APNs Token: $apnsToken');
    print('FCM Token: $token');
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