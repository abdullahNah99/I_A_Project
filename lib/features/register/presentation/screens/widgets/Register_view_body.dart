import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_a_project/core/widgets/custom_button.dart';
import 'package:i_a_project/core/widgets/custom_text_field.dart';
import 'package:i_a_project/core/widgets/space_widgets.dart';
import 'package:i_a_project/features/register/presentation/screens/widgets/password_text_field.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/cubits.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/states.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        // if (state is RegisterFailure) {
        //   Navigator.pop(context);
        //   CustomSnackBar.showErrorSnackBar(
        //     context,
        //     message: state.failureMsg,
        //   );
        // } else if (state is RegisterSuccess) {
        //   Navigator.pop(context);
        //   state.navigateToHome(context);
        // } else if (state is RegisterLoading) {
        //   CustomProgressIndicator.showProgressIndicator(context);
        // }
      },
      buildWhen: (previous, current) {
        if (current is RegisterInitial) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
        return SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Center(
              child: Column(
                children: [
                  // const DesignSection(),
                  Image.asset('assets/images/signin_balls.png'),
                  const Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const VerticalSpace(2),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.person),
                    labelText: 'Username',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'required';
                      }
                      return null;
                    },
                  ),
                  const VerticalSpace(2),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.email),
                    textInputAction: TextInputAction.next,
                    labelText: 'Email',
                    onChanged: (p0) => cubit.email = p0,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'required';
                      } else {
                        if (!RegExp(r'\S+@\S+\.\S+')
                            .hasMatch(value.toString())) {
                          return "Please enter a valid email address";
                        }
                      }
                      return null;
                    },
                  ),
                  const VerticalSpace(2),
                  PasswordTextField("Password"),
                  const VerticalSpace(2),
                  PasswordTextField("Confirm password"),
                  const VerticalSpace(2),
                  CustomButton(
                    text: 'Sign up',
                    color: Colors.blue,
                    onTap: () async {
                      return context.go('/GroupsScreen');
                      // if (cubit.formKey.currentState!.validate()) {}
                    },
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
