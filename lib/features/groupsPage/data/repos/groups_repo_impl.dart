import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:i_a_project/core/errors/failure.dart';
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
        token:
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MDQ2NTc0ODIsImV4cCI6MTcwNDY2MTA4MiwibmJmIjoxNzA0NjU3NDgyLCJqdGkiOiJ2OXQ1UG1Xa0pxeXRUUnZIIiwic3ViIjoiNSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.Fm6i6Lw6ExZQ1RAL1-EqyXcVRqYXlSmNNmPyPRLSNPU",
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
