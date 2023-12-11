import 'package:flutter/material.dart';
import 'package:i_a_project/core/constants.dart';
import 'package:i_a_project/core/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final double? width;
  final String text;
  final double? borderRadius;
  final Color? color;
  const CustomButton({
    super.key,
    this.onTap,
    this.width,
    required this.text,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        gradient: LinearGradient(
          colors: [
            AppConstants.gradient1,
            AppConstants.gradient2,
            AppConstants.gradient3
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          onTap: onTap,
          child: SizedBox(
            width: width ?? SizeConfig.defaultSize * 30,
            height: SizeConfig.defaultSize * 4,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.defaultSize * 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
