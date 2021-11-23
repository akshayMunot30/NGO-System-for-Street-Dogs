import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool isPasswordField;

  CustomInput({
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    required this.isPasswordField,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 6.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        obscureText: isPasswordField,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0,
          ),
        ),
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}
