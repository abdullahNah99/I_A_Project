import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/features/auth/presentation/cubits/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  // final AuthenticationRepo authenticationRepo;
  final formKey = GlobalKey<FormState>();
  IconData passwordSuffixIcon = Icons.remove_red_eye;
  String email = '';
  String password = '';
  bool obscureText = true;

  LoginCubit(
      // {required this.authenticationRepo}
      )
      : super(LoginInitial());

  void changePasswordSuffixIcon() {
    if (passwordSuffixIcon == Icons.remove_red_eye) {
      passwordSuffixIcon = FontAwesomeIcons.solidEyeSlash;
    } else {
      passwordSuffixIcon = Icons.remove_red_eye;
    }
    obscureText = !obscureText;
    emit(LoginChangeSuffixIcon());
  }

  // Future<void> login() async {
  //   emit(LoginLoading());
  //   (await authenticationRepo.login(email: email, password: password)).fold(
  //     (failure) {
  //       emit(LoginFailure(failureMsg: failure.errorMessege));
  //     },
  //     (loginResponseModel) async {
  //       await CacheHelper.saveData(
  //         key: 'Token',
  //         value: loginResponseModel.token,
  //       );
  //       await CacheHelper.saveData(
  //         key: 'Role',
  //         value: loginResponseModel.role,
  //       );
  //       await CacheHelper.saveData(
  //         key: 'UserID',
  //         value: getUserID(
  //           token: loginResponseModel.token,
  //         ),
  //       );
  //       if (loginResponseModel.role == 'patient') {
  //         getPatientData(loginResponseModel: loginResponseModel);
  //       } else if (loginResponseModel.role == 'secretary') {
  //         getSecretaryData(loginResponseModel: loginResponseModel);
  //       } else {
  //         getDoctorData(loginResponseModel: loginResponseModel);
  //       }
  //     },
  //   );
  // }
}
