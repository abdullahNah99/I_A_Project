import 'package:flutter/material.dart';
import 'package:i_a_project/core/constants.dart';
import 'package:i_a_project/core/utils/app_router.dart';
import 'package:i_a_project/core/utils/dio_helper.dart';
import 'package:i_a_project/core/utils/service_locator.dart';
import 'package:i_a_project/core/utils/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  DioHelper.init();
  runApp(const IAProject());
}

class IAProject extends StatelessWidget {
  const IAProject({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: AppConstants.backgroundColor),
      routerConfig: AppRouter.router,
    );
  }
}

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
