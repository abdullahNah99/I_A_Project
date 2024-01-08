import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/core/widgets/custom_error_widget.dart';
import 'package:i_a_project/core/widgets/custom_loading_indicator.dart';
import 'package:i_a_project/core/widgets/custom_spacer.dart';
import 'package:i_a_project/core/widgets/space_widgets.dart';
import 'package:i_a_project/features/groupsPage/presentation/manger/user_group_cubit/user_groups_cubit.dart';
import 'package:i_a_project/features/groupsPage/presentation/manger/user_group_cubit/user_groups_state.dart';
import 'widgets/SideMenu.dart';
import 'widgets/group_item.dart';
import 'widgets/header.dart';
import 'widgets/my_groups.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: GroupsScreenBody(),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupsScreenBody extends StatelessWidget {
  const GroupsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const customSpacer(),
              const MyGroups(),
              const VerticalSpace(1),
              ListGroups(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListGroups extends StatelessWidget {
  const ListGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserGroupsCubit, UserGroupsState>(
      builder: (context, state) {
        if (state is UserGroupsSuccess) {
          return GridView.builder(
              shrinkWrap: true,
              itemCount: state.Groups.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, crossAxisSpacing: 30, mainAxisSpacing: 30),
              itemBuilder: (context, index) {
                return GroupItem(
                  group: state.Groups[index],
                );
              });
        } else if (state is UserGroupsFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
