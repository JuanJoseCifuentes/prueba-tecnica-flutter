import 'package:flutter/material.dart';
import 'package:flutter_prueba_conocimiento/core/helper/app_navigator.dart';
import 'package:flutter_prueba_conocimiento/features/navigation/presentation/pages/map.dart';
import 'custom_card.dart';

class CardTableParents extends StatelessWidget {
  const CardTableParents({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            GestureDetector(
              onTap: () {
              },
              child: SingleCard(
                color: Colors.black,
                icon: Icons.route,
                text: 'Mapa',
                colorIcon: const Color.fromRGBO(43, 57, 93, 1),
                onPressed: () {
                  AppNavigator.push(context, MapPage());
                },
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: SingleCard(
                color: Colors.black,
                icon: Icons.terrain_sharp,
                text: 'Opción 2',
                colorIcon: const Color.fromRGBO(43, 57, 93, 1),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            GestureDetector(
              onTap: () {
              },
              child: SingleCard(
                color: Colors.black,
                icon: Icons.accessibility,
                text: 'Opción 3',
                colorIcon: const Color.fromRGBO(43, 57, 93, 1),
                onPressed: () {
                },
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: SingleCard(
                color: Colors.black,
                icon: Icons.phone,
                text: 'Opción 4',
                colorIcon: const Color.fromRGBO(43, 57, 93, 1),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}