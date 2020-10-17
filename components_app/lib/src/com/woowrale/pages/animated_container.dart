import 'dart:math';
import 'package:flutter/material.dart';

class AnimaterContainerPage extends StatefulWidget {
  @override
  _AnimaterContainerPageState createState() => _AnimaterContainerPageState();
}

class _AnimaterContainerPageState extends State<AnimaterContainerPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.yellow;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  /*
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  */
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
        width: _width,
        height: _height,
        decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _changeShape,
      ),
    );
  }

  void _changeShape() {
    final ramdom = Random();

    setState(() {
      _width = ramdom.nextInt(300).toDouble();
      _height = ramdom.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          ramdom.nextInt(255), ramdom.nextInt(255), ramdom.nextInt(255), 1);

      _borderRadius = BorderRadius.circular(ramdom.nextInt(100).toDouble());
    });
  }
}
