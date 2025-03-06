import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> children;

  const HomeScreen(this.children, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  bool showGreeting = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if(showGreeting) widget.children[0],
              widget.children[currentPageIndex + 1]
            ],
          ),
        ),
      ),
      bottomNavigationBar: _navBar(),
    );
  }

  Widget _navBar() {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(
            icon: Icon(Icons.notifications), label: "Notificaciones"),
        NavigationDestination(icon: Icon(Icons.settings), label: "Opciones"),
      ],
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          showGreeting = false;
          if(index == 0) {
            showGreeting = true;
          }
          currentPageIndex = index;
        });
      },
    );
  }
}
