import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errormessege});
final String errormessege;
  @override
  Widget build(BuildContext context) {
    return Text(errormessege,style: TextStyle(
      
    ));
  }
}