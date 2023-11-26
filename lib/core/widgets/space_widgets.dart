import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class HorizintalSpace extends StatelessWidget {
  final double value;
  const HorizintalSpace(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize * value,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  final double value;
  const VerticalSpace(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize * value,
    );
  }
}
