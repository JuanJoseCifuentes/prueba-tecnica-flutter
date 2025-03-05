import 'package:flutter/material.dart';

class LoadingDialog {
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Fondo transparente
          elevation: 0,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7), // Fondo semitransparente
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Color del círculo
                  strokeWidth: 6.0, // Grosor del círculo
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  static Future<void> showWithoutConext(GlobalKey<NavigatorState> navigatorKey) {
    return showDialog(
      context: navigatorKey.currentState!.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Fondo transparente
          elevation: 0,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7), // Fondo semitransparente
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Color del círculo
                  strokeWidth: 6.0, // Grosor del círculo
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideWithoutContext(GlobalKey<NavigatorState> navigatorKey) {
    final navigatorState = navigatorKey.currentState;
    if (navigatorState != null && navigatorState.canPop()) {
      navigatorState.pop();
    }
  }
}