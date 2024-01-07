import 'package:go_router/go_router.dart';
<<<<<<< Updated upstream
import 'package:i_a_project/features/auth/presentation/screens/login_screen.dart';
=======
import 'package:i_a_project/features/groupsPage/presentation/screens/test_download_file.dart';
import 'package:i_a_project/features/login/presentation/screens/login_screen.dart';
import 'package:i_a_project/features/register/presentation/screens/register_screen.dart';
import 'package:i_a_project/features/splash/splash_view.dart';
>>>>>>> Stashed changes

abstract class AppRouter {
  static const kRegisterView = '/RegisterView';
  static const kLoginView = '/LoginView';
  static const kGroupsView = '/GroupsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
<<<<<<< Updated upstream
=======
      GoRoute(
        path: kRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: kGroupsView,
        builder: (BuildContext context, GoRouterState state) {
          return TestDownloadFile(
            token: state.extra as String,
          );
        },
      ),
>>>>>>> Stashed changes
    ],
  );
}
