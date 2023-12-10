import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/features/register/presentation/cubit/regisetr_cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  // final AuthenticationRepo authenticationRepo;
  final formKey = GlobalKey<FormState>();
  IconData passwordSuffixIcon = Icons.remove_red_eye;
  String email = '';
  String password = '';
  bool obscureText = true;

  RegisterCubit(
      // {required this.authenticationRepo}
      )
      : super(RegisterInitial());

  void changePasswordSuffixIcon() {
    if (passwordSuffixIcon == Icons.remove_red_eye) {
      passwordSuffixIcon = FontAwesomeIcons.solidEyeSlash;
    } else {
      passwordSuffixIcon = Icons.remove_red_eye;
    }
    obscureText = !obscureText;
    emit(RegisterChangeSuffixIcon());
  }
  // Future<void> Register() async {
  //   emit(RegisterLoading());
  //   (await authenticationRepo.Register(email: email, password: password)).fold(
  //     (failure) {
  //       emit(RegisterFailure(failureMsg: failure.errorMessege));
  //     },
  //     (RegisterResponseModel) async {
  //       await CacheHelper.saveData(
  //         key: 'Token',
  //         value: RegisterResponseModel.token,
  //       );
  //       await CacheHelper.saveData(
  //         key: 'Role',
  //         value: RegisterResponseModel.role,
  //       );
  //       await CacheHelper.saveData(
  //         key: 'UserID',
  //         value: getUserID(
  //           token: RegisterResponseModel.token,
  //         ),
  //       );
  //       if (RegisterResponseModel.role == 'patient') {
  //         getPatientData(RegisterResponseModel: RegisterResponseModel);
  //       } else if (RegisterResponseModel.role == 'secretary') {
  //         getSecretaryData(RegisterResponseModel: RegisterResponseModel);
  //       } else {
  //         getDoctorData(RegisterResponseModel: RegisterResponseModel);
  //       }
  //     },
  //   );
  // }
}
