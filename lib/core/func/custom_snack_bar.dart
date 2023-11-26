import 'package:flutter/material.dart';
import 'package:i_a_project/core/utils/size_config.dart';

abstract class CustomSnackBar {
  static void showCustomSnackBar(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: SizeConfig.defaultSize * 2),
        ),
        backgroundColor:
            backgroundColor?.withOpacity(.9) ?? Colors.green.withOpacity(.9),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.only(
          bottom: SizeConfig.screenHeight - SizeConfig.defaultSize * 15,
          left: 5,
          right: 5,
        ),
      ),
    );
  }

  static void showErrorSnackBar(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: SizeConfig.screenHeight * .5,
          left: 10,
          right: 10,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
            Center(
              child: Text(
                message,
                style: TextStyle(fontSize: SizeConfig.defaultSize * 2),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 30),
      ),
    );
  }
}
