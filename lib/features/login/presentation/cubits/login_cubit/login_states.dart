import 'package:i_a_project/features/login/data/models/user_model.dart';

abstract class LoginStates {}

final class LoginInitial extends LoginStates {}

final class LoginLoading extends LoginStates {}

final class LoginChangeSuffixIcon extends LoginStates {}

final class LoginSuccess extends LoginStates {
  final UserModel userModel;

  LoginSuccess({required this.userModel});
}

final class LoginFailure extends LoginStates {
  final String failureMsg;

  LoginFailure({required this.failureMsg});
}
