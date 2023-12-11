import 'package:flutter/material.dart';
import 'package:i_a_project/core/widgets/space_widgets.dart';

class MyGroups extends StatelessWidget {
  const MyGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" My groups ",
                      style: Theme.of(context).textTheme.subtitle1),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add_box_outlined),
                      label: Text("Create new group"))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
