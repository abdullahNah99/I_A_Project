import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/login_cubit/login_states.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      buildWhen: (previous, current) {
        if (current is LoginChangeSuffixIcon) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
        return CustomTextField(
          prefixIcon: const Icon(Icons.lock),
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
          labelText: 'Password',
          onChanged: (p0) => cubit.password = p0,
          onFieldSubmitted: (p0) async {
            if (cubit.formKey.currentState!.validate()) {
              // await cubit.login();
            }
          },
          textInputAction: TextInputAction.go,
          obscureText: cubit.obscureText,
          maxLines: 1,
        );
      },
    );
  }
}
