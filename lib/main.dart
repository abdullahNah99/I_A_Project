import 'package:flutter/material.dart';
import 'package:i_a_project/core/utils/app_router.dart';
import 'package:i_a_project/core/utils/cache_helper.dart';
import 'package:i_a_project/core/utils/dio_helper.dart';
import 'package:i_a_project/core/utils/service_locator.dart';
import 'package:i_a_project/core/utils/size_config.dart';

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
    return MaterialApp.router(      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
      
    );
  }
}
