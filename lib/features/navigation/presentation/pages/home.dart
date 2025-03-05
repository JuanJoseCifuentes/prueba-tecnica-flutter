import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> children;

  const HomeScreen(this.children, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }
}