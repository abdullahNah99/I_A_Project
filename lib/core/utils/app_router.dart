import 'package:go_router/go_router.dart';
import 'package:i_a_project/features/auth/presentation/screens/login_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
