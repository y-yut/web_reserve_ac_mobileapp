import 'package:go_router/go_router.dart';
import '../features/auth/presentation/login_page.dart';
import '../features/mypage/presentation/mypage_page.dart';

// 仮のログイン状態（本来はProviderやSharedPreferencesなどで管理）
bool isLoggedIn = false;

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/mypage',
      builder: (context, state) => const MyPage(),
    ),
    // 他のルートを追加
  ],
  redirect: (context, state) {
    // ルートが'/'（ログイン画面）で、ログイン済みならマイページへリダイレクト
    if (state.uri.toString() == '/' && isLoggedIn) {
      return '/mypage';
    }
    // ルートが'/mypage'で未ログインならログイン画面へリダイレクト
    if (state.uri.toString() == '/mypage' && !isLoggedIn) {
      return '/';
    }
    return null;
  },
);