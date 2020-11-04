import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _buildPageOne(),
          _buildPageTwo(),
        ],
      ),
    );
  }

  Widget _buildPageOne() {
    return Stack(
      children: [
        _buildBackgroundColor(),
        _buildBackgroundImage(),
        _buildContent(),
      ],
    );
  }

  Widget _buildBackgroundColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/images/scroll.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildContent() {
    final textStyle = TextStyle(color: Colors.white, fontSize: 50.0);

    return SafeArea(
      child: Column(
        children: [
          Text('11', style: textStyle),
          Text('Miércoles', style: textStyle),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildPageTwo() {
    return Stack(
      children: [_buildBackgroundColor(), _buildButton()],
    );
  }

  Widget _buildButton() {
    final textStyle = TextStyle(color: Colors.white, fontSize: 20.0);
    return Container(
        child: Center(
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Text('Bienvenido', style: textStyle),
        color: Colors.blue,
        onPressed: () {},
      ),
    ));
  }
}
