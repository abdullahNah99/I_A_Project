import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_a_project/core/func/custom_progress_indicator.dart';
import 'package:i_a_project/core/func/custom_snack_bar.dart';
import 'package:i_a_project/core/widgets/custom_button.dart';
import 'package:i_a_project/core/widgets/custom_text_field.dart';
import 'package:i_a_project/core/widgets/space_widgets.dart';
import 'package:i_a_project/features/register/presentation/screens/widgets/password_text_field.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/cubits.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/states.dart';
import '../../../../../core/utils/size_config.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterLoading && !CustomProgressIndicator.isOpen) {
          CustomProgressIndicator.showProgressIndicator(context);
        } else {
          if (CustomProgressIndicator.isOpen) {
            context.pop();
          }

          if (state is RegisterFailure) {
            CustomSnackBar.showErrorSnackBar(context,
                message: state.failureMsg);
          } else if (state is RegisterSuccess) {
            context.pushReplacement('/');
          }
        }
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
          child: Center(
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
                child: Center(
                  child: Column(
                    children: [
                      // const DesignSection(),
                      Image.asset('assets/images/signin_balls.png'),
                      const Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const VerticalSpace(2),
                      CustomTextField(
                        prefixIcon: const Icon(Icons.person),
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => cubit.name = value,
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
                      const PasswordTextField(
                        label: "Password",
                        textInputAction: TextInputAction.next,
                      ),
                      const VerticalSpace(2),
                      const PasswordTextField(
                        label: "Confirm password",
                        textInputAction: TextInputAction.go,
                      ),
                      const VerticalSpace(2),
                      CustomButton(
                        text: 'Sign up',
                        color: Colors.blue,
                        onTap: () async {
                          if (cubit.formKey.currentState!.validate()) {
                            await cubit.register();
                          }
                        },
                      ),
                      const VerticalSpace(3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: SizeConfig.defaultSize,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text(
                              'Sign In',
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
              ),
            ),
          ),
        );
      },
    );
  }
}
