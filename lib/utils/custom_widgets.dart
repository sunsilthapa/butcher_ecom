import 'package:flutter/material.dart';

import 'app_fonts.dart';

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
      style: AppFonts.bodyText(),
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

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double width;
  final Widget? leadingIcon;

  const CustomButton({
    required this.text,
    required this.onPressed,
    required this.width,
    this.leadingIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green.shade900),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.grey),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 20),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) ...[
              leadingIcon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: AppFonts.bodyText(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
