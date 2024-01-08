import 'package:flutter/material.dart';
import 'package:i_a_project/features/groupsPage/data/models/group_model.dart';
import '../../../../../core/widgets/custom_spacer.dart';

class GroupItem extends StatelessWidget {
  final GroupModel group;

  const GroupItem({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 199, 124, 219),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${group.groupId}"),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
                customSpacer(),
                Text('${group.userId}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
