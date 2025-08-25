import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ログイン')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(auth == null ? '未ログイン' : 'ようこそ ${auth.name} さん'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await ref.read(authNotifierProvider.notifier).login('user', 'pass');
              },
              child: const Text('ログイン'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).logout();
              },
              child: const Text('ログアウト'),
            ),
          ],
        ),
      ),
    );
  }
}