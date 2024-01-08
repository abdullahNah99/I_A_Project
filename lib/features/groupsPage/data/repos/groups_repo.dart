import 'package:dartz/dartz.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/features/groupsPage/data/models/group_model.dart';

abstract class GroupsRepo {
  Future<Either<Failure, List<GroupModel>>> getGroupsOfUser();
}
