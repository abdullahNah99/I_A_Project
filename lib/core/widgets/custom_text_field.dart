import 'package:flutter/material.dart';
import 'package:i_a_project/core/utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final String? hintText, labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? suffixIconOnTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final int? maxLines;
  final int? maxLength;
  final String? initialValue;
  final bool autofocus;
  final TextInputAction? textInputAction;
  const CustomTextField({
    super.key,
    this.width,
    this.hintText,
    this.suffixIconOnTap,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.maxLines,
    this.initialValue,
    this.autofocus = false,
    this.maxLength,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? SizeConfig.defaultSize * 25,
      child: TextFormField(
        autofocus: autofocus,
        initialValue: initialValue,
        textInputAction: textInputAction,
        obscureText: obscureText ?? false,
        onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator ??
            (value) {
              if (value?.isEmpty ?? true) {
                return 'required';
              } else if (keyboardType == TextInputType.emailAddress) {
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value.toString())) {
                  return "Please enter a valid email address";
                }
              }
              return null;
            },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 22),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
