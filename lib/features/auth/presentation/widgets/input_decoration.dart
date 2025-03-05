import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
    required BuildContext context,
    Widget? suffixIcon,
    String? errorText, // Add this line
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      suffix: suffixIcon,
      labelStyle: const TextStyle(),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
            )
          : null,
      errorText: errorText, // Aquí se agrega el errorText
      errorStyle: const TextStyle(
        color: Colors.red, // Color del texto de error
      ),
    );
  }
}
