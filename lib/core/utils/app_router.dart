import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_a_project/features/auth/presentation/screens/login_screen.dart';
import 'package:i_a_project/features/register/presentation/screens/register_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
        routes: [
          GoRoute(
            path: 'register',
            builder: (BuildContext context, GoRouterState state) {
              return const RegisterView();
            },
          ),
        ],
      ),
    ],
  );
}
