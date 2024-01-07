import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/features/login/data/repos/authentication_repo.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final AuthenticationRepo authenticationRepo;
  final formKey = GlobalKey<FormState>();
  IconData passwordSuffixIcon = Icons.remove_red_eye;
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool obscureText = true;

  RegisterCubit({required this.authenticationRepo}) : super(RegisterInitial());

  void changePasswordSuffixIcon() {
    if (passwordSuffixIcon == Icons.remove_red_eye) {
      passwordSuffixIcon = FontAwesomeIcons.solidEyeSlash;
    } else {
      passwordSuffixIcon = Icons.remove_red_eye;
    }
    obscureText = !obscureText;
    emit(RegisterChangeSuffixIcon());
  }

  Future<void> register() async {
    emit(RegisterLoading());
    (await authenticationRepo.register(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    ))
        .fold(
      (failure) {
        emit(RegisterFailure(failureMsg: failure.errorMessege));
      },
      (user) async {
        // await CacheHelper.saveData(
        //   key: 'Token',
        //   value: RegisterResponseModel.token,
        // );
        emit(RegisterSuccess());
      },
    );
  }
}
