import 'package:flutter/material.dart';


class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? cardTextStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text('Bienvenido a BO-TECH',
              //     style: cardTextStyle,
              // ),
              SizedBox(height: 16),
              // Text('¿Que quieres hacer hoy?',
              //     style:cardTextStyle),
            ]),
      ),
    );
  }
}
