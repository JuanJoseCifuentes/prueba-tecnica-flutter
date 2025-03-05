
import 'package:flutter/material.dart';

import '../../../../core/themes/color_schemes.g.dart';

class CustomNovedadesCard extends StatelessWidget {
  final String text;
  final Color cardColor;
  final Color textColor;
  final VoidCallback onTap;

  const CustomNovedadesCard({
    super.key,
    required this.text,
    required this.onTap,
    this.cardColor = const Color.fromRGBO(218, 226, 255, 1),
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0, left: 20, right: 20, top: 18),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 350,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: cardColor,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final Color colorIcon;
  final VoidCallback onPressed;

  const SingleCard({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
    required this.colorIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? cardTextStyle = Theme.of(context).textTheme.titleMedium;
    final brightness = Theme.of(context).brightness;
    final Color surfaceContainerHighest = (brightness == Brightness.dark) ? darkSurfaceContainerHighest : lightSurfaceContainerHighest;
    Color cardBackground = surfaceContainerHighest;
    return Card(
      elevation: 0,
      color: cardBackground,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: onPressed,
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  icon,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: cardTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

