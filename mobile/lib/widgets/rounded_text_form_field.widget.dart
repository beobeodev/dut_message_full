import 'package:flutter/material.dart';
import 'package:mobile/core/constants/font_family.dart';
import 'package:mobile/core/theme/palette.dart';

class RoundedTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? hintText;
  final String? errorText;
  final double borderRadius;
  final Color borderColor;
  final Widget? suffixIconWidget;
  final Widget? prefixIconWidget;

  const RoundedTextFormField({
    Key? key,
    required this.textController,
    this.validator,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    this.borderRadius = 6,
    this.borderColor = Palette.blue200,
    this.suffixIconWidget,
    this.prefixIconWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textInputAction: TextInputAction.done,
      onChanged: (val) {},
      onTap: () {},
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        hintStyle: const TextStyle(
          fontFamily: FontFamily.fontNunito,
          color: Palette.white300,
          fontSize: 14,
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        suffixIcon: suffixIconWidget,
        prefixIcon: prefixIconWidget,
        errorText: errorText == '' || errorText == null ? null : errorText,
      ),
    );
  }
}
