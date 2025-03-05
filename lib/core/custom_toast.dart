import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class CustomToast {
  // Método para mostrar un toast de éxito
  static Future<void> showSuccess({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return _showToast(
      context: context,
      icon: Icons.check_circle,
      primaryColor: const Color.fromARGB(255, 135, 185, 226),
      secondaryColor: const Color(0xFF187bcd),
      title: title,
      description: description,
    );
  }

  // Método para mostrar un toast de error
  static Future<void> showError({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return _showToast(
      context: context,
      icon: Icons.error,
      primaryColor: const Color(0xFFEF9A9A),
      secondaryColor: const Color(0xFFB30303),
      title: title,
      description: description,
    );
  }

  // Método para mostrar un toast de alerta
  static Future<void> showAlert({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return _showToast(
      context: context,
      icon: Icons.warning,
      primaryColor: const Color.fromARGB(255, 236, 220, 165),
      secondaryColor: const Color.fromARGB(255, 254, 200, 4),
      title: title,
      description: description,
    );
  }

  // Método privado para mostrar el toast directamente
  static Future<void> _showToast({
    required BuildContext context,
    required IconData icon,
    required Color primaryColor,
    required Color secondaryColor,
    required String title,
    required String description,
  }) async {
    MotionToast(
      icon: icon,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      title: Text(title),
      description: Text(description),
      width: 300,
      height: 100,
    ).show(context);
  }
}