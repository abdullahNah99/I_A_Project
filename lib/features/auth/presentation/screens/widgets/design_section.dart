import 'package:flutter/material.dart';
import 'package:i_a_project/core/utils/size_config.dart';
import 'package:i_a_project/core/widgets/custom_image.dart';
import 'package:i_a_project/core/widgets/space_widgets.dart';

class DesignSection extends StatelessWidget {
  const DesignSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const VerticalSpace(1),
        const CustomImage(
          image: 'assets/images/folders.png',
        ),
        Text(
          'Welcom Back',
          style: TextStyle(
            fontSize: SizeConfig.defaultSize * 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Glad To See You Again ',
              style: TextStyle(
                fontSize: SizeConfig.defaultSize,
                color: Colors.grey.withOpacity(.7),
                fontStyle: FontStyle.italic,
              ),
            ),
            const Icon(
              Icons.waving_hand,
              color: Colors.yellow,
            ),
          ],
        ),
        Text(
          'Login To Your Account Below',
          style: TextStyle(
            fontSize: SizeConfig.defaultSize,
            color: Colors.grey.withOpacity(.7),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
