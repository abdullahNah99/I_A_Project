import 'package:flutter/material.dart';

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
                      style: Theme.of(context).textTheme.titleMedium),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_box_outlined),
                      label: const Text("Create new group")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
