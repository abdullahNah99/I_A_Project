import 'package:flutter/material.dart';
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
<<<<<<< Updated upstream
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius ?? 25),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 25),
        onTap: onTap,
        child: SizedBox(
          width: width ?? SizeConfig.defaultSize * 25,
          height: SizeConfig.defaultSize * 3.7,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.defaultSize * 2.5,
=======
    return Container(
      width: width ?? SizeConfig.defaultSize * 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        gradient: const LinearGradient(
          colors: [
            AppConstants.gradient1,
            AppConstants.gradient2,
            AppConstants.gradient3
          ],
        ),
      ),
      child: Material(
        color: const Color.fromRGBO(0, 0, 0, 0),
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
>>>>>>> Stashed changes
              ),
            ),
          ),
        ),
      ),
    );
  }
}
