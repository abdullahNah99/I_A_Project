abstract class LoginStates {}

final class LoginInitial extends LoginStates {}

final class LoginLoading extends LoginStates {}

final class LoginChangeSuffixIcon extends LoginStates {}

final class LoginSuccess extends LoginStates {}

final class LoginFailure extends LoginStates {
  final String failureMsg;

  LoginFailure({required this.failureMsg});
}
