import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? height;
  final double? width;
  final Color? buttonColor; // Color del botón
  final Color? textColor;   // Color del texto

  const BasicAppButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.width,
    this.content,
    this.buttonColor,   // Nuevo parámetro opcional
    this.textColor,     // Nuevo parámetro opcional
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50, // Si quieres que siempre sea 50 de altura
        ),
        backgroundColor: buttonColor ?? Theme.of(context).colorScheme.surface,  // Aplicar el color del botón
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),  // Ajuste del padding
        child: content ?? Text(
          title,
        ),
      ),
    );
  }
}
