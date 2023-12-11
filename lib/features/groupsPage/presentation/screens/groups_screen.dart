import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_a_project/core/constants.dart';
import 'package:i_a_project/core/widgets/custom_spacer.dart';
import 'package:i_a_project/core/widgets/space_widgets.dart';
import 'package:i_a_project/features/groupsPage/presentation/screens/widgets/DrawerListTile.dart';

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
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30),
                  itemBuilder: (context, index) {
                    return const groupItem();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
