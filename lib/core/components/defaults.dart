import 'package:flutter/material.dart';

import '../constants/constants.dart';

Widget defaultTextFormField({
  required double width,
  required double height,
  TextEditingController? controller,
  TextInputType? keyboardType,
  required double radius,
  TextStyle? labelStyle,
  Widget? suffixIcon,
  Widget? prefixIcon,
  String? title,
  ValueChanged<String>? onChanged,
  FormFieldValidator<String>? validator,
  ValueChanged<String>? onSubmit,
  bool obscureText = false,
  int maxLine = 1,
  TextDirection textDirection = TextDirection.ltr,
  required BuildContext context,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      maxLines: maxLine,
      textDirection: textDirection,
      style: Theme.of(context).textTheme.titleMedium,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: title,
        errorMaxLines: 3,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p10, vertical: AppPadding.p10),
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColorGrey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColorGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onSubmit,
    ),
  );
}

Widget defaultButton({
  Color? buttonColor,
  required VoidCallback onPressed,
  required Widget buttonChild,
  required double width,
  required double height,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: MaterialButton(
      onPressed: onPressed,
      color: buttonColor ?? AppColors.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppRadius.r5,
        ),
      ),
      child: buttonChild,
    ),
  );
}

Widget mobileHomeSearchBar({
  required double width,
  required double height,
  TextEditingController? controller,
  TextInputType? keyboardType,
  Widget? label,
  required double radius,
  TextStyle? labelStyle,
  Widget? suffixIcon,
  Widget? prefixIcon,
  ValueChanged<String>? onChanged,
  FormFieldValidator<String>? validator,
  ValueChanged<String>? onSubmit,
  bool obscureText = false,
  int maxLine = 1,
  bool enabled = true,
  TextDirection textDirection = TextDirection.ltr,
  required BuildContext context,
}) {
  return Theme(
    data: Theme.of(context).copyWith(
      splashColor: AppColors.transparentColor,
    ),
    child: TextFormField(
      enabled: enabled,
      cursorColor: Theme.of(context).primaryColor,
      maxLines: maxLine,
      textDirection: textDirection,
      style: Theme.of(context).textTheme.bodyLarge,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: AppColors.textFormFieldFillColor,
        contentPadding: const EdgeInsetsDirectional.all(AppPadding.p10),
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFormFieldFillColor),
          borderRadius: BorderRadius.circular(AppRadius.r18),
        ),
        prefixIcon: prefixIcon,
        filled: true,
        label: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFormFieldFillColor),
          borderRadius: BorderRadius.circular(AppRadius.r18),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFormFieldFillColor),
          borderRadius: BorderRadius.circular(AppRadius.r18),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFormFieldFillColor),
          borderRadius: BorderRadius.circular(AppRadius.r18),
        ),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onSubmit,
    ),
  );
}
