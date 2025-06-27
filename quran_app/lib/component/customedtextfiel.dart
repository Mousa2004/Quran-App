import 'package:flutter/material.dart';

class Customedtextfiel extends StatelessWidget {
  final String? text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  const Customedtextfiel({
    super.key,
    required this.text,
    required this.controller,
    required this.validator,
    required this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Color(0xFFBE87E6)),
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: text,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(color: Color(0xFFBE87E6)),
        fillColor: Color(0xFFF0DCFA),
        filled: true,
      ),
    );
  }
}
