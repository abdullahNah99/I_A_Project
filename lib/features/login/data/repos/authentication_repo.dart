import 'package:dartz/dartz.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/features/login/data/models/user_model.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
  // Future<Either<Failure, void>> logout({
  //   required String token,
  // });
}
