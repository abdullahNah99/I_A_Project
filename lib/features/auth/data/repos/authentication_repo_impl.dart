// import 'dart:developer';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:i_a_project/core/errors/failure.dart';
// import 'package:i_a_project/core/utils/dio_helper.dart';

// class AuthenticationRepoImpl extends AuthenticationRepo {
//   @override
//   Future<Either<Failure, LoginResponseModel>> login(
//       {required String email, required String password}) async {
//     try {
//       var response = await DioHelper.postData(
//         url: 'login',
//         body: {
//           'email': email,
//           'password': password,
//         },
//       );
//       return right(LoginResponseModel.fromJson(response.data));
//     } catch (ex) {
//       log('There is an error in login method in AuthenticationRepoImpl');
//       if (ex is DioException) {
//         return left(
//           ServerFailure(
//             ex.response?.data['message'] ??
//                 'Something Went Wrong, Please Try Again',
//           ),
//         );
//       }
//       return left(ServerFailure(ex.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> logout({required String token}) async {
//     try {
//       await DioHelper.getData(url: 'logout', token: token);
//       return right(null);
//     } catch (ex) {
//       log('There is an error in logout method in AuthenticationRepoImpl');
//       log(ex.toString());
//       if (ex is DioException) {
//         log(ex.response?.data.toString() ?? '');
//         return left(ServerFailure.fromDioException(ex));
//       }
//       return left(ServerFailure(ex.toString()));
//     }
//   }
// }
