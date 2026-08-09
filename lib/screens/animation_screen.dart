import 'dart:math';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});
  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}
class _AnimationScreenState extends State<AnimationScreen> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blueAccent;

  void _cambiarForma(){
    final random = Random();
    setState(() {
      _width=100.0 +random.nextInt(200);
      _height=100.0 +random.nextInt(200);
      _color = Color.fromARGB(255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation')),
      body:
      Center(
        child: AnimatedContainer(
        width: _width,
        height: _height,
        color: _color,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: const Icon(Icons.play_arrow_rounded),
        ),
    );
  }
}