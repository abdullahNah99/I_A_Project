import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/core/utils/dio_helper.dart';
import 'package:i_a_project/features/login/data/models/file_model.dart';
import 'package:i_a_project/features/login/data/models/user_model.dart';
import 'package:i_a_project/features/login/data/repos/authentication_repo.dart';
// import 'dart:html' as html;

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
      print(ex.toString());
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

  @override
  Future<Either<Failure, void>> uploadFile({
    required String token,
    required PlatformFile file,
    required int groupID,
  }) async {
    try {
      await DioHelper.uploadFile(
        url: 'uploadFiles',
        body: {'group_id': '1'},
        file: file,
        token: token,
      );
      return right(null);
    } catch (ex) {
      log('There is an error in uploadFile method in AuthenticationRepoImpl');
      print(ex.toString());
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

  @override
  Future<Either<Failure, List<FileModel>>> showGroupFiles({
    required String token,
    required int groupID,
  }) async {
    try {
      var response = await DioHelper.getData(
        url: 'filesGroup/$groupID',
        token: token,
      );
      List<FileModel> files = [];
      for (var file in response.data['files:']) {
        files.add(FileModel.fromJson(file));
      }
      return right(files);
    } catch (ex) {
      log('There is an error in showAllFiles method in AuthenticationRepoImpl');
      print(ex.toString());
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

  @override
  Future<Either<Failure, void>> downloadFile({
    required String token,
    required FileModel fileModel,
  }) async {
    try {
      Response response = await DioHelper.getData(
        url: 'downloadFile/${fileModel.id}',
        token: token,
        responseType: ResponseType.bytes,
      );

      AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64,${base64Encode(
          response.data,
        )}',
      )
        ..setAttribute('download', fileModel.fileName)
        ..click();

      return right(null);
    } catch (ex) {
      log('There is an error in downloadFile method in AuthenticationRepoImpl');
      print(ex.toString());
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

  @override
  Future<Either<Failure, List<User>>> getGroupUsers(
      {required int groupID}) async {
    try {
      var response = await DioHelper.getData(url: 'usersGroup/$groupID');
      final List<User> users = [];
      for (var user in response.data['users:']) {
        users.add(User.fromJson(user));
      }
      return right(users);
    } catch (ex) {
      log('There is an error in getGroupUsers method in AuthenticationRepoImpl');
      print(ex.toString());
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

  @override
  Future<Either<Failure, void>> checkin({
    required String token,
    required int fileID,
  }) async {
    try {
      await DioHelper.postData(
        url: 'checkin/$fileID',
        body: {},
        token: token,
      );
      return right(null);
    } catch (ex) {
      log('There is an error in checkin method in AuthenticationRepoImpl');
      print(ex.toString());
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

  @override
  Future<Either<Failure, void>> checkout({
    required String token,
    required int fileID,
  }) async {
    try {
      await DioHelper.postData(
        url: 'checkout/$fileID',
        body: {},
        token: token,
      );
      return right(null);
    } catch (ex) {
      log('There is an error in checkout method in AuthenticationRepoImpl');
      print(ex.toString());
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

  @override
  Future<Either<Failure, CreateGroupResponse>> createGroup({
    required String name,
    required String token,
  }) async {
    try {
      var response = await DioHelper.postData(
        url: 'group',
        body: {'group_name': name},
        token: token,
      );
      return right(CreateGroupResponse.fromJson(response.data['success']));
    } catch (ex) {
      log('There is an error in createGroup method in AuthenticationRepoImpl');
      print(ex.toString());
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

  @override
  Future<Either<Failure, List<FileReportModel>>> getFileReport({
    required String token,
    required int fileID,
  }) async {
    try {
      var response = await DioHelper.getData(
        url: 'file-history-report?id=$fileID',
        token: token,
      );
      final List<FileReportModel> fileReport = [];
      for (var item in response.data['data']['fileRecords']) {
        fileReport.add(FileReportModel.fromJson(item));
      }
      return right(fileReport);
    } catch (ex) {
      log('There is an error in getFileReport method in AuthenticationRepoImpl');
      print(ex.toString());
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
