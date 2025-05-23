import 'package:your_tour_guide/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.labelText,
    this.borderColor = kTextColor ,
    this.textColor = kTextColor ,
    this.prefixIcon,
    this.obscureText = false,
    this.textInputType,
    this.onChanged,
    this.validator,
    this.controller,
    this.suffixIcon,
  }) : super(key: key);

  final String labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText ;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        keyboardType: textInputType,
        obscureText: obscureText,
        cursorColor: Colors.white,
        style: TextStyle(
          color: textColor!,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          errorMaxLines: 2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:  BorderSide(
              color: borderColor!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:  BorderSide(
              color: borderColor!,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:  BorderSide(
              color: borderColor!,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: TextStyle(
            color: borderColor!,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        ),
      ),
    );
  }
}
