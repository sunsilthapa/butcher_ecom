import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;

  const CustomTextField({
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      cursorColor: Colors.green.shade900,
      cursorHeight: 20,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.green.shade900,
          size: 20,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 17.0),
      ),
    );
  }
}
