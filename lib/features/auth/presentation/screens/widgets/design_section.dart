// import 'package:flutter/material.dart';
// import 'package:i_a_project/core/utils/size_config.dart';

// class DesignSection extends StatelessWidget {
//   const DesignSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: SizeConfig.screenWidth,
//       height: SizeConfig.defaultSize * 30,
//       decoration: const BoxDecoration(
//         color: AppColors.defaultColor,
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(2000),
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(width: SizeConfig.screenWidth),
//           const VerticalSpace(5),
//           const CustomImage(image: AppAssets.logo),
//           const VerticalSpace(2),
//           Text(
//             'Welcome To Med Manager',
//             style: TextStyle(
//               fontSize: SizeConfig.defaultSize * 2.6,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const VerticalSpace(1),
//           Text(
//             'Helping You To Find Best Doctors',
//             style: TextStyle(
//               fontSize: SizeConfig.defaultSize * 1.6,
//               color: Colors.white.withOpacity(.4),
//               fontStyle: FontStyle.italic,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
