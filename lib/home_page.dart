// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _radiusAnimation = Tween(begin: 450.0, end: 10.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController..addListener(() {
      setState(() {
        ///
      });
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                height: 225,
                width: 225,
                decoration: BoxDecoration(
                  color: const Color(0xFF692D94),
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF692D94).withOpacity(0.8),
                      offset: const Offset(-6, -6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(-6, -6),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.5,
              child: Container(
                height: 175,
                width: 175,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 1.0,
              child: Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 144, 52, 209).withOpacity(0.9),
                      offset: const Offset(-3, -3),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(-3, -3),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 1.5,
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 49, 27, 65).withOpacity(1.0),
                      offset: const Offset(-1, -1),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(-1, -1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
