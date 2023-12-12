import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/core/utils/dio_helper.dart';
import 'package:i_a_project/features/login/data/models/user_model.dart';
import 'package:i_a_project/features/login/data/repos/authentication_repo.dart';

class AuthenticationRepoImpl extends AuthenticationRepo {
  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      var response = await DioHelper.postData(
        url: 'auth/login',
        body: {
          'email': email,
          'password': password,
        },
      );
      return right(UserModel.fromJson(response.data['user']));
    } catch (ex) {
      log('There is an error in login method in AuthenticationRepoImpl');
      log(ex.toString());
      if (ex is DioException) {
        return left(
          ServerFailure(
            ex.response?.data['message'] ??
                'Something Went Wrong, Please Try Again',
          ),
        );
      }
      return left(ServerFailure(ex.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var response = await DioHelper.postData(
        url: 'auth/register',
        body: {
          'name': name,
          'email': email,
          'password': password,
          'c_password': confirmPassword,
        },
      );
      return right(UserModel.fromJson(response.data['user']));
    } catch (ex) {
      log('There is an error in register method in AuthenticationRepoImpl');
      if (ex is DioException) {
        return left(
          ServerFailure(
            ex.response?.data['msg']['email'][0] ??
                'Something Went Wrong, Please Try Again',
          ),
        );
      }
      return left(ServerFailure(ex.toString()));
    }
  }

  // @override
  // Future<Either<Failure, void>> logout({required String token}) async {
  //   try {
  //     await DioHelper.getData(url: 'logout', token: token);
  //     return right(null);
  //   } catch (ex) {
  //     log('There is an error in logout method in AuthenticationRepoImpl');
  //     log(ex.toString());
  //     if (ex is DioException) {
  //       log(ex.response?.data.toString() ?? '');
  //       return left(ServerFailure.fromDioException(ex));
  //     }
  //     return left(ServerFailure(ex.toString()));
  //   }
  // }
}
