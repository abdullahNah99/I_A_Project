import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/core/utils/cache_helper.dart';
import 'package:i_a_project/core/utils/dio_helper.dart';
import 'package:i_a_project/features/groupsPage/data/models/group_model.dart';
import 'package:i_a_project/features/groupsPage/data/repos/groups_repo.dart';

class GroupsRepoImpl implements GroupsRepo {
  @override
  @override
  Future<Either<Failure, List<GroupModel>>> getGroupsOfUser() async {
    try {
      var data = await DioHelper.getData(
        url: "/usersGroup",
        token: await CacheHelper.getData(key: 'Token'),
      );
      List<GroupModel> Groups = [];
      for (var item in data.data['groups:']) {
        try {
          Groups.add(GroupModel.fromJson(item));
        } catch (e) {
          Groups.add(GroupModel.fromJson(item));
        }
      }

      return right(Groups);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
