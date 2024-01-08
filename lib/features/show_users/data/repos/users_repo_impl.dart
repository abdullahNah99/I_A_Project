import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/core/utils/dio_helper.dart';
import 'package:i_a_project/features/show_users/data/models/showusersmodel.dart';
import 'package:i_a_project/features/show_users/data/models/usersid.dart';
import 'package:i_a_project/features/show_users/data/repos/users_repo.dart';

class users_repo_impl implements users_repo {
//  users_repo_impl();


  
  @override
  Future<Either<Failure, List<showusersmodel>>> fetchlistofusers({
  required String token
  }
  ) async {
    try {
      var response = await DioHelper.getData(
        url: '/users',
        token:token
            );
      

      List<showusersmodel> showusers = [];
      for (var item in response.data['users:']) {
        showusers.add(showusersmodel.fromJson(item));
      }
      return right(showusers);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<showusersmodel>>> fetchresultsearch() {
    // TODO: implement fetchresultsearch
    throw UnimplementedError();
  }
  
  @override
   Future<Either<Failure, void>> addusers({
    required String token,
    required int groupid,
    required List<String> user_ids
  }) async {
    try {
      await DioHelper.postData(
        url: 'addUserToGroup/$groupid',
        body: {
          "user_ids":user_ids
        },
        token: token,
      );
      return right(null);
    } catch (ex) {
      print(ex.toString());
      if (ex is DioException) {
        return left(
          ServerFailure(
            ex.response?.data['msg']??
                'Something Went Wrong, Please Try Again',
          ),
        );
      }
      return left(ServerFailure(ex.toString()));
    }
  }
  }

