import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _GreenBox(),
          _HeaderLogo(),
          child,
        ],
      ),
    );
  }
}

class _HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: const Image(
            image: AssetImage('assets/logonuevo.png'),
          )),
    );
  }
}

class _GreenBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      // decoration: _blueBackground(),
      child: Stack(
        children: [
          Positioned(
            top: 90,
            left: 30,
            child: _Bubble(),
          ),
          Positioned(
            top: 70,
            left: 300,
            child: _Bubble(),
          ),
          Positioned(
            top: -50,
            left: -20,
            child: _Bubble(),
          ),
          Positioned(
            bottom: -30,
            left: 10,
            child: _Bubble(),
          ),
          Positioned(
            bottom: -120,
            right: 20,
            child: _Bubble(),
          ),
        ],
      ),
    );
  }

  // BoxDecoration _blueBackground() {
  //   return const BoxDecoration(
  //     gradient: LinearGradient(
  //       colors: [
  //
  //         Color.fromRGBO(218, 226, 255, 70),
  //         Color.fromRGBO(43, 57, 93, 50)
  //       ]
  //
  //   ),
  //   );
  // }
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(233, 137, 137, 0.047)),
    );
  }
}
