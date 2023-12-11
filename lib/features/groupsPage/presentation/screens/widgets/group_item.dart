import 'package:flutter/material.dart';
import 'package:i_a_project/features/groupsPage/presentation/screens/groups_screen.dart';

import '../../../../../core/widgets/custom_spacer.dart';

class groupItem extends StatelessWidget {
  const groupItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Group id"),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
                customSpacer(),
                Text('Group admin')
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 199, 124, 219),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
