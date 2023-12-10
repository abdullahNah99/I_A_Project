import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/cubits.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/states.dart';
import '../../../../../core/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatelessWidget {
  late String label;
  PasswordTextField(this.label, {super.key});

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
          onChanged: (p0) => cubit.password = p0,
          onFieldSubmitted: (p0) async {
            if (cubit.formKey.currentState!.validate()) {
              // await cubit.Register();
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
