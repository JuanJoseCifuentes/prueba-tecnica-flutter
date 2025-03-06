import 'package:flutter/material.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Opciones",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text("opción 1"),
        SizedBox(
          height: 5,
        ),
        Text("opción 2")
      ],
    );
  }
}
