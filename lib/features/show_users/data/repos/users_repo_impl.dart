import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/core/utils/dio_helper.dart';
import 'package:i_a_project/features/show_users/data/models/showusersmodel.dart';
import 'package:i_a_project/features/show_users/data/repos/users_repo.dart';

class users_repo_impl implements users_repo {
//  users_repo_impl();
  @override
  Future<Either<Failure, List<showusersmodel>>> fetchlistofusers() async {
    try {
      var response = await DioHelper.getData(
        url: '/users',
        token:
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MDQ2Mjg4NTYsImV4cCI6MTcwNDYzMjQ1NiwibmJmIjoxNzA0NjI4ODU2LCJqdGkiOiJRWkgyZWJlT21aZmRJM1FYIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.p9FGZ0nnla_xjnHLWVZPmqnZPeY6zER69jynhrd--r4',
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
}
