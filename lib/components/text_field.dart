import 'package:flutter/material.dart';

class UserAndPass extends StatelessWidget {
  final controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final labelStyle;
  final prefixIcon;
  final hintStyle;

  const UserAndPass({
    super.key, this.controller, required this.labelText, required this.hintText, required this.obscureText, this.labelStyle, this.prefixIcon, this.hintStyle, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        style: TextStyle(color: Colors.black),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            ),
            fillColor: Colors.grey.shade200,
            filled: true
        ),
      ),
    );
  }
}