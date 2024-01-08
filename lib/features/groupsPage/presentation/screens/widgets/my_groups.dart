import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:i_a_project/core/utils/app_router.dart';
import 'package:i_a_project/core/utils/cache_helper.dart';
import 'package:i_a_project/core/widgets/custom_button.dart';
import 'package:i_a_project/core/widgets/custom_text_field.dart';
import 'package:i_a_project/features/groupsPage/presentation/manger/user_group_cubit/user_groups_cubit.dart';
import 'package:i_a_project/features/login/data/repos/authentication_repo_impl.dart';

class MyGroups extends StatelessWidget {
  const MyGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserGroupsCubit cubit = BlocProvider.of<UserGroupsCubit>(context);
    String groupname = "";
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
                  Text("My groups",
                      style: Theme.of(context).textTheme.titleMedium),
                  ElevatedButton(
                    //  icon: const Icon(Icons.add_box_outlined),
                    //   label: const
                    child: Text("Create new group"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("creat a new group"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("enter name of group"),
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextField(
                                prefixIcon: Icon(Icons.group),
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => groupname = value,
                                labelText: 'group name',
                                keyboardType: TextInputType.name,
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                (await AuthenticationRepoImpl().createGroup(
                                  name: groupname,
                                  token: CacheHelper.getData(key: 'Token'),
                                ))
                                    .fold(
                                        // ignore: avoid_print
                                        (l) => print(l),
                                        // ignore: avoid_print
                                        (r) {
                                  print("success: ID=${r.id} Name=${r.name}");
                                  GoRouter.of(context).go(AppRouter.kusersView);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                child: const CustomButton(text: "OK"),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
