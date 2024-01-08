import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_a_project/core/utils/app_router.dart';
import 'package:i_a_project/core/utils/size_config.dart';
import 'package:i_a_project/core/widgets/custom_button.dart';
import 'package:i_a_project/features/groupsPage/presentation/screens/test_upload_file.dart';
import 'package:i_a_project/features/groupsPage/presentation/screens/widgets/custom_file_widget.dart';
import 'package:i_a_project/features/login/data/models/file_model.dart';
import 'package:i_a_project/features/login/data/repos/authentication_repo_impl.dart';
import 'package:i_a_project/features/show_users/presentation/screens/show_users.dart';
import '../../../../core/utils/cache_helper.dart';

class TestDownloadFile extends StatefulWidget {
  final String token;
  const TestDownloadFile({super.key, required this.token});

  @override
  State<TestDownloadFile> createState() => _TestDownloadFileState();
}

class _TestDownloadFileState extends State<TestDownloadFile> {
  List<FileModel> files = [];
  void showAllFiles() async {
    (await AuthenticationRepoImpl().showGroupFiles(
      token: widget.token,
      groupID: 1,
    ))
        .fold(
      (failure) {},
      (success) {
        files = success;
      },
    );
  }

  @override
  void initState() {
    setState(() {
      showAllFiles();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomButton(
            text: 'Go TO Upload',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TestUploadFile(token: widget.token);
                  },
                ),
              );
            },
          ),
          CustomButton(
            text: 'users',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ShowUsers(token: widget.token);
                  },
                ),
              );
            },
          ),
          CustomButton(
            text: 'setState',
            onTap: () async {
              // await AuthenticationRepoImpl().getGroupUsers(groupID: 2);
              // log(CacheHelper.getData(key: 'Token').toString());
              setState(() {});
            },
          ),
          CustomButton(
            text: 'LogOut',
            onTap: () async {
              await CacheHelper.deletData(key: 'Token');
              while (context.canPop()) {
                context.pop();
              }
              context.push(AppRouter.kLoginView);
            },
          ),
          CustomButton(
            text: 'CreateGroup',
            onTap: () async {
              (await AuthenticationRepoImpl().createGroup(
                name: 'Testt',
                token: widget.token,
              ))
                  .fold(
                // ignore: avoid_print
                (l) => print(l),
                // ignore: avoid_print
                (r) => print("success: ID=${r.id} Name=${r.name}"),
              );
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize),
              itemCount: files.length,
              itemBuilder: (context, index) {
                return CustomFileWidget(
                  fileModel: files[index],
                  token: widget.token,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
