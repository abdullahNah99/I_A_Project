import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/core/utils/service_locator.dart';
import 'package:i_a_project/features/login/data/repos/authentication_repo_impl.dart';
import 'package:i_a_project/features/login/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:i_a_project/features/login/presentation/screens/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        authenticationRepo: getIt.get<AuthenticationRepoImpl>(),
      ),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
