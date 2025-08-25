import 'package:go_router/go_router.dart';
import '../features/auth/presentation/login_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    // 他のルートを追加
  ],
);