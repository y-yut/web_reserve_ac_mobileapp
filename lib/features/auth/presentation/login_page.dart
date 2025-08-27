import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FutureBuilderでバージョン情報を取得
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final version = snapshot.hasData ? snapshot.data!.version : '';

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
                  child: const Text('新規登録'),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('ゲスト利用'),
                        ),
                      ),
                      const SizedBox(width: 24), // ボタン間のスペース
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('アカウント削除'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('version: $version'),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}