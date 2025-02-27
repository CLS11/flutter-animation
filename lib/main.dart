import 'package:Glow/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Glow());
}

class Glow extends StatelessWidget {
  const Glow({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}