import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/features/login/data/models/file_model.dart';
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

  Future<Either<Failure, void>> uploadFile({
    required String token,
    required PlatformFile file,
    required int groupID,
  });

  Future<Either<Failure, List<FileModel>>> showGroupFiles({
    required String token,
    required int groupID,
  });

  Future<Either<Failure, void>> downloadFile({
    required String token,
    required FileModel fileModel,
  });

  Future<Either<Failure, List<User>>> getGroupUsers({required int groupID});

  Future<Either<Failure, void>> checkin({
    required String token,
    required int fileID,
  });

  Future<Either<Failure, void>> checkout({
    required String token,
    required int fileID,
  });

  Future<Either<Failure, CreateGroupResponse>> createGroup({
    required String name,
    required String token,
  });

  Future<Either<Failure, List<FileReportModel>>> getFileReport({
    required String token,
    required int fileID,
  });
  // Future<Either<Failure, void>> logout({
  //   required String token,
  // });
}

class FileReportModel {
  final String userName;
  final String state;
  final String date;

  FileReportModel({
    required this.userName,
    required this.state,
    required this.date,
  });

  factory FileReportModel.fromJson(Map<String, dynamic> jsonData) {
    return FileReportModel(
      userName: jsonData['userName'],
      state: jsonData['state'],
      date: jsonData['date'],
    );
  }
}

class CreateGroupResponse {
  final int id;
  final String name;

  CreateGroupResponse({required this.id, required this.name});

  factory CreateGroupResponse.fromJson(Map<String, dynamic> jsonData) {
    return CreateGroupResponse(
      id: jsonData['id'],
      name: jsonData['group_name'],
    );
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(name: jsonData['name'], email: jsonData['email']);
  }
}
