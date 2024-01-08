import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/core/utils/dio_helper.dart';
import 'package:i_a_project/core/utils/service_locator.dart';
import 'package:i_a_project/features/show_users/data/repos/users_repo_impl.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_cubit.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_states.dart';
import 'package:i_a_project/features/show_users/presentation/screens/widgets/show_users_body.dart';

class ShowUsers extends StatelessWidget {
  const ShowUsers({super.key, required this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ShowUsersCubit(ur: getIt.get<users_repo_impl>(), token: token)
            ..fetchurers(),
      child: BlocConsumer<ShowUsersCubit, ShowUsersStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return const Scaffold(
              body: ShowUsersBody(),
            );
          }),
    );
  }
}
