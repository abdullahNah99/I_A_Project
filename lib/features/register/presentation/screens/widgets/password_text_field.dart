import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/cubits.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/states.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class PasswordTextField extends StatelessWidget {
  final String label;
  final TextInputAction? textInputAction;
  const PasswordTextField({
    super.key,
    required this.label,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      buildWhen: (previous, current) {
        if (current is RegisterChangeSuffixIcon) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);

        return CustomTextField(
          prefixIcon: const Icon(Icons.lock),
          textInputAction: textInputAction,
          onFieldSubmitted: label == 'Password'
              ? null
              : (value) async {
                  await cubit.register();
                },
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              cubit.changePasswordSuffixIcon();
            },
            child: Icon(
              cubit.passwordSuffixIcon,
              color: Colors.grey,
            ),
          ),
          labelText: label,
          onChanged: (p0) {
            if (label == 'Confirm password') {
              cubit.confirmPassword = p0;
            } else {
              cubit.password = p0;
            }
          },
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Required';
            } else {
              if (label == 'Confirm password') {
                if (cubit.confirmPassword != cubit.password) {
                  return 'Passwords Does Not Match';
                }
              }
            }

            return null;
          },
          // onFieldSubmitted: (p0) async {
          //   if (cubit.formKey.currentState!.validate()) {
          //     // await cubit.Register();
          //   }
          // },
          // textInputAction: TextInputAction.go,
          obscureText: cubit.obscureText,
          maxLines: 1,
        );
      },
    );
  }
}
