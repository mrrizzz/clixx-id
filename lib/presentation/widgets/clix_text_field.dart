import 'package:bioskop/presentation/misc/constants.dart';
import 'package:flutter/material.dart';

class ClixTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const ClixTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: ghostWhite),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ghostWhite),
        ),
      ),
    );
  }
}
