// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:web_reserve_ac_mobileapp/app/app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // ProviderScopeでラップしてAppをテスト
    await tester.pumpWidget(const ProviderScope(child: App()));

    // 以降は必要に応じてテスト内容を修正
    // 例: expect(find.text('0'), findsOneWidget);
  });
}
