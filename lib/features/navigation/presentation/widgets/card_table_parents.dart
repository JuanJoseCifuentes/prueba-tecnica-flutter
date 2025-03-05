import 'package:flutter/material.dart';
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
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}