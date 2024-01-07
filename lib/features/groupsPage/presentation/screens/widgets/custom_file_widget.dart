import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:i_a_project/core/utils/size_config.dart';
import 'package:i_a_project/features/login/data/models/file_model.dart';
import '../../../../login/data/repos/authentication_repo_impl.dart';

class CustomFileWidget extends StatelessWidget {
  final String token;
  final FileModel fileModel;
  const CustomFileWidget({
    super.key,
    required this.fileModel,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize),
        height: SizeConfig.defaultSize * 2.7,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          // borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              fileModel.fileName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.defaultSize,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    log('CheckIN');
                    await AuthenticationRepoImpl().checkin(
                      token: token,
                      fileID: fileModel.id,
                    );
                  },
                  icon: Icon(
                    Icons.check_circle,
                    size: SizeConfig.defaultSize * 1.5,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    log('CheckOUT');
                    await AuthenticationRepoImpl().checkout(
                      token: token,
                      fileID: fileModel.id,
                    );
                  },
                  icon: Icon(
                    Icons.check_circle_outline,
                    size: SizeConfig.defaultSize * 1.5,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await AuthenticationRepoImpl().downloadFile(
                      fileName: fileModel.fileName,
                      token: token,
                    );
                  },
                  icon: Icon(
                    Icons.download,
                    size: SizeConfig.defaultSize * 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
