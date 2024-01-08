import 'package:get_it/get_it.dart';
import 'package:i_a_project/features/groupsPage/data/repos/groups_repo.dart';
import 'package:i_a_project/features/groupsPage/data/repos/groups_repo_impl.dart';
import 'package:i_a_project/features/login/data/repos/authentication_repo_impl.dart';
import 'package:i_a_project/features/show_users/data/repos/users_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthenticationRepoImpl>(
    AuthenticationRepoImpl(),
  );
  getIt.registerSingleton<GroupsRepoImpl>(
    GroupsRepoImpl());
  getIt.registerSingleton<GroupsRepoImpl>(GroupsRepoImpl());
  getIt.registerSingleton<users_repo_impl>(
    users_repo_impl(),
  );
}
