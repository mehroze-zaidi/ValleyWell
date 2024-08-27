import 'package:flutter/cupertino.dart';
import 'package:valley_well/utils/constants/app_colors.dart';

class CupertinoAppTextfield extends StatelessWidget {
  const CupertinoAppTextfield(
      {super.key,
      this.controller,
      this.label,
      this.color = AppColors.textfieldLightSurfaceColor,
      this.contentPadding,
      this.filled = true,
      this.hint,
      this.hintStyle,
      this.maxLines = 1,
      this.borderRadius = 10,
      this.textStyle,
      this.validator,
      this.onChange,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.textDirection,
      this.showShadow = false,
      this.keyboardType});

  final TextEditingController? controller;
  final String? label;
  final bool filled;
  final bool obscureText;
  final Color color;
  final EdgeInsets? contentPadding;
  final String? hint;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final int maxLines;
  final double borderRadius;
  final String? Function(String? value)? validator;
  final Function(String value)? onChange;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(

        autofocus: false,
        obscureText: obscureText,
        controller: controller,
        maxLines: maxLines,
        //  validator: validator,
        onChanged: onChange,
        style: textStyle ??
            CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: AppColors.black,
                ),
        textDirection: textDirection,
        keyboardType: keyboardType,
        placeholder: hint,
        placeholderStyle: hintStyle ??
            CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: AppColors.black40,
                ),
        padding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        prefix: prefixIcon,
        suffix: suffixIcon,


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: showShadow
              ? [
                  const BoxShadow(
                      color: AppColors.black40,
                      blurRadius: 3,
                      offset: Offset(0, 2))
                ]
              : null,
          color: color,
        ));
  }
}
