import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
   final String errMessage;
  const CustomErrorWidget({super.key, required this.errMessage});
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        // style: Style.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}

