import 'package:get_it/get_it.dart';
import 'package:i_a_project/features/login/data/repos/authentication_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthenticationRepoImpl>(
    AuthenticationRepoImpl(),
  );
}
