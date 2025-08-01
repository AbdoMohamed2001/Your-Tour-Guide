import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.labelText,
    this.prefixIcon,
    this.isObscure = false,
    this.textInputType,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.focusNode,
    this.isEnabled = true,
    this.labelColor,
  }) : super(key: key);
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool isObscure;
  final String labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool isEnabled;
  final Color? labelColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      controller: controller,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      keyboardType: textInputType,
      obscureText: isObscure,
      style: TextStyles.regular14,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
      ),
    );
  }
}
