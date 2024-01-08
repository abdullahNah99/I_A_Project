import 'package:bloc/bloc.dart';
import 'package:i_a_project/features/groupsPage/data/repos/groups_repo.dart';
import 'package:i_a_project/features/groupsPage/presentation/manger/user_group_cubit/user_groups_state.dart';

class UserGroupsCubit extends Cubit<UserGroupsState> {
  UserGroupsCubit(this.groupsrepo) : super(UserGroupsInitial());
  final GroupsRepo groupsrepo;
  Future<void> fetchGroupsUsers() async {
    emit(UserGroupsLoading());
    var result = await groupsrepo.getGroupsOfUser();
    result.fold((failure) {
      emit(UserGroupsFailure(failure.errorMessege));
    }, (groups) {
      emit(UserGroupsSuccess(groups));
    });
  }
}
