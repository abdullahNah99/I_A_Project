import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/cubits.dart';
import 'package:i_a_project/features/register/presentation/screens/widgets/Register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
          // authenticationRepo: getIt.get<AuthenticationRepoImpl>(),
          ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const Scaffold(
          body: RegisterViewBody(),
        ),
      ),
    );
  }
}
