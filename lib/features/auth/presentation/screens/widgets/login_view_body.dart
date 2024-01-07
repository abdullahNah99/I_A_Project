import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< Updated upstream:lib/features/auth/presentation/screens/widgets/login_view_body.dart
=======
import 'package:go_router/go_router.dart';
import 'package:i_a_project/core/func/custom_progress_indicator.dart';
import 'package:i_a_project/core/func/custom_snack_bar.dart';
import 'package:i_a_project/core/utils/app_router.dart';
import 'package:i_a_project/core/utils/cache_helper.dart';
>>>>>>> Stashed changes:lib/features/login/presentation/screens/widgets/login_view_body.dart
import 'package:i_a_project/core/utils/size_config.dart';
import 'package:i_a_project/core/widgets/custom_button.dart';
import 'package:i_a_project/core/widgets/custom_text_field.dart';
import 'package:i_a_project/core/widgets/space_widgets.dart';
import 'package:i_a_project/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:i_a_project/features/auth/presentation/cubits/login_cubit/login_states.dart';
import 'package:i_a_project/features/auth/presentation/screens/widgets/design_section.dart';
import 'package:i_a_project/features/auth/presentation/screens/widgets/password_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
<<<<<<< Updated upstream:lib/features/auth/presentation/screens/widgets/login_view_body.dart
        // if (state is LoginFailure) {
        //   Navigator.pop(context);
        //   CustomSnackBar.showErrorSnackBar(
        //     context,
        //     message: state.failureMsg,
        //   );
        // } else if (state is LoginSuccess) {
        //   Navigator.pop(context);
        //   state.navigateToHome(context);
        // } else if (state is LoginLoading) {
        //   CustomProgressIndicator.showProgressIndicator(context);
        // }
=======
        if (state is LoginLoading && !CustomProgressIndicator.isOpen) {
          CustomProgressIndicator.showProgressIndicator(context);
        } else {
          if (CustomProgressIndicator.isOpen) context.pop();
          if (state is LoginFailure) {
            CustomSnackBar.showErrorSnackBar(
              context,
              message: state.failureMsg,
            );
          } else if (state is LoginSuccess) {
            context.pushReplacement(
              AppRouter.kGroupsView,
              extra: state.userModel.token,
            );
          }
        }
>>>>>>> Stashed changes:lib/features/login/presentation/screens/widgets/login_view_body.dart
      },
      // listener: (context, state) {
      //   if (state is LoginFailure) {
      //     Navigator.pop(context);
      //     CustomSnackBar.showErrorSnackBar(
      //       context,
      //       message: state.failureMsg,
      //     );
      //   } else if (state is LoginSuccess) {
      //     Navigator.pop(context);
      //     GoRouter.of(context).pushReplacement('/GroupsScreen');
      //   } else if (state is LoginLoading) {
      //     CustomProgressIndicator.showProgressIndicator(context);
      //   }
      // },
      buildWhen: (prev, cur) => cur is LoginInitial,
      builder: (context, state) {
        final LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize),
            width: SizeConfig.screenWidth * .35,
            // height: SizeConfig.screenHeight * .95,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  const DesignSection(),
                  const VerticalSpace(2),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.email),
                    textInputAction: TextInputAction.next,
                    labelText: 'Email',
                    onChanged: (p0) => cubit.email = p0,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const VerticalSpace(2),
                  const PasswordTextField(),
                  const VerticalSpace(3),
                  CustomButton(
                    text: 'Login',
                    color: Colors.blue,
                    onTap: () async {
                      // log(CacheHelper.getData(key: 'Token').toString());
                      if (cubit.formKey.currentState!.validate()) {
                        // await cubit.login();
                      }
                    },
                  ),
                  const VerticalSpace(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: SizeConfig.defaultSize,
                        ),
                      ),
                      TextButton(
<<<<<<< Updated upstream:lib/features/auth/presentation/screens/widgets/login_view_body.dart
                        onPressed: () {},
=======
                        onPressed: () {
                          context.push(AppRouter.kRegisterView);
                        },
>>>>>>> Stashed changes:lib/features/login/presentation/screens/widgets/login_view_body.dart
                        child: const Text(
                          'SignUp For Free',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
