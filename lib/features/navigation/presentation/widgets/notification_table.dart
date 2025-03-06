import 'package:flutter/material.dart';
import 'custom_card.dart';

class NotificationTable extends StatelessWidget {
  const NotificationTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Column(
        children: List.generate(10, (index) => _notificationCard(index + 1)),
      ),
    );
  }

  Widget _notificationCard(int notificationIndex) {
    return SizedBox(
      width: double.infinity,
      child: SingleCard(
        color: Colors.black,
        icon: Icons.notifications,
        text: 'Notificación $notificationIndex',
        colorIcon: const Color.fromRGBO(43, 57, 93, 1),
        onPressed: () {},
      ),
    );
  }
}
