import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final double? fontSize;
  final String? fontFamily;

  const CustomTextFormField({
    required this.controller,
    this.fontSize,
    this.fontFamily,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: fontFamily,
        color: const Color(0xFFA7A9AC),
      ),
      readOnly: true,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            width: 2.0,
            color: Color(0xFFA7A9AC),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            width: 2.0,
            color: Color(0xFFA7A9AC),
          ),
        ),
      ),
    );
  }
}
