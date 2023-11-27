import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/core/widgets/custom_button.dart';
import 'package:i_a_project/core/widgets/custom_text_field.dart';
import 'package:i_a_project/core/widgets/space_widgets.dart';
import 'package:i_a_project/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:i_a_project/features/auth/presentation/cubits/login_cubit/login_states.dart';
import 'package:i_a_project/features/auth/presentation/screens/widgets/password_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
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
      },
      buildWhen: (previous, current) {
        if (current is LoginInitial) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
        return SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                // const DesignSection(),
                const VerticalSpace(7),
                CustomTextField(
                  prefixIcon: const Icon(Icons.email),
                  textInputAction: TextInputAction.next,
                  labelText: 'Email',
                  onChanged: (p0) => cubit.email = p0,
                  keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value?.isEmpty ?? true) {
                  //     return 'required';
                  //   } else {
                  //     if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value.toString())) {
                  //       return "Please enter a valid email address";
                  //     }
                  //   }
                  //   return null;
                  // },
                ),
                const VerticalSpace(3),
                const PasswordTextField(),
                const VerticalSpace(10),
                CustomButton(
                  text: 'Login',
                  color: Colors.blue,
                  onTap: () async {
                    if (cubit.formKey.currentState!.validate()) {
                      // await cubit.login();
                    }
                  },
                ),
                const VerticalSpace(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
