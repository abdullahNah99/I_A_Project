import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class CustomImage extends StatelessWidget {
  final double? width, height;
  final String? image;
  final Color? color;
  final bool circleShape;
  final BoxFit? fit;
  final double? iconSize;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const CustomImage({
    super.key,
    this.width,
    this.height,
    this.image,
    this.color,
    this.circleShape = false,
    this.fit,
    this.borderRadius,
    this.iconSize,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig.defaultSize * 6,
      height: height ?? SizeConfig.defaultSize * 6,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: !circleShape ? borderRadius : null,
        shape: circleShape ? BoxShape.circle : BoxShape.rectangle,
        image: image != null
            ? DecorationImage(
                image: AssetImage(image!),
                fit: fit,
              )
            : null,
      ),
      child: image == null
          ? Icon(
              Icons.person,
              size: iconSize ?? SizeConfig.defaultSize * 9,
              color: Colors.grey,
            )
          : null,
    );
  }
}

// class CustomNetworkImage extends StatelessWidget {
//   final double? width, height;
//   final String? imageUrl;
//   final Color? color;
//   final EdgeInsetsGeometry? margin;
//   final EdgeInsetsGeometry? padding;
//   final bool circleShape;
//   final BoxFit? fit;
//   final double? borderRadius;
//   final double? iconSize;
//   final bool withBorder;
//   final Color? borderColor;
//   final AlignmentGeometry? alignment;
//   final double borderWidth;
//   const CustomNetworkImage({
//     super.key,
//     this.width,
//     this.height,
//     this.imageUrl,
//     this.color,
//     this.margin,
//     this.padding,
//     this.circleShape = false,
//     this.fit,
//     this.borderRadius,
//     this.iconSize,
//     this.withBorder = false,
//     this.borderColor,
//     this.alignment,
//     this.borderWidth = 1,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? SizeConfig.defaultSize * 10,
//       height: height ?? SizeConfig.defaultSize * 10,
//       alignment: alignment,
//       margin: margin,
//       padding: padding,
//       decoration: BoxDecoration(
//         border: withBorder
//             ? Border.all(
//                 width: borderWidth,
//                 color: borderColor ?? Colors.grey.withOpacity(.3),
//               )
//             : null,
//         borderRadius:
//             !circleShape ? BorderRadius.circular(borderRadius ?? 20) : null,
//         color: color ?? Colors.transparent,
//         shape: circleShape ? BoxShape.circle : BoxShape.rectangle,
//         image: imageUrl != 'default'
//             ? DecorationImage(
//                 fit: fit,
//                 image: CachedNetworkImageProvider(
//                   '${AppConstants.baseUrlIP}upload/${imageUrl!}',
//                 ),
//               )
//             : null,
//       ),
//       child: imageUrl == 'default'
//           ? Icon(
//               Icons.person,
//               size: iconSize ?? SizeConfig.defaultSize * 9,
//               color: AppColors.defaultColor,
//             )
//           : null,
//     );
//   }
// }
