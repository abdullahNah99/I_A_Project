import 'package:equatable/equatable.dart';
import 'package:i_a_project/features/groupsPage/data/models/group_model.dart';

abstract class UserGroupsState extends Equatable {
  const UserGroupsState();

  @override
  List<Object> get props => [];
}

class UserGroupsInitial extends UserGroupsState {}

class UserGroupsLoading extends UserGroupsState {}

class UserGroupsFailure extends UserGroupsState {
  final String errMessage;

  const UserGroupsFailure(this.errMessage);
}

class UserGroupsSuccess extends UserGroupsState {
  final List<GroupModel> Groups;

  const UserGroupsSuccess(this.Groups);
}
