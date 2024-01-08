import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_a_project/core/constants.dart';
import 'package:i_a_project/core/utils/app_router.dart';
import 'package:i_a_project/core/utils/cache_helper.dart';
import 'package:i_a_project/core/utils/dio_helper.dart';
import 'package:i_a_project/core/utils/service_locator.dart';
import 'package:i_a_project/core/utils/size_config.dart';
import 'package:i_a_project/features/groupsPage/data/repos/groups_repo.dart';
import 'package:i_a_project/features/groupsPage/data/repos/groups_repo_impl.dart';
import 'package:i_a_project/features/groupsPage/presentation/manger/user_group_cubit/user_groups_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  DioHelper.init();
  CacheHelper.init();
  runApp(const IAProject());
}

class IAProject extends StatelessWidget {
  const IAProject({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserGroupsCubit(
            getIt.get<GroupsRepoImpl>(),
          )..fetchGroupsUsers(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppConstants.backgroundColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white)),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
