import 'package:flutter/material.dart';
import 'router.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Web Reserve AC',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}