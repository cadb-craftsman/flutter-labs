import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildSingleColumScroll(),
        ],
      ),
      bottomNavigationBar: _buildBottonNavigationBar(context),
    );
  }

  Widget _buildBackground() {
    final gradiente = Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1),
              colors: [
                Color.fromRGBO(52, 54, 101, 1.0),
                Color.fromRGBO(35, 37, 57, 1.0),
              ]),
        ));

    final containerBox = Container(
      height: 360.0,
      width: 360.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80.0),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(236, 98, 188, 1.0),
          Color.fromRGBO(241, 142, 172, 1.0),
        ]),
      ),
    );

    final pinkBox = Positioned(
        top: -100,
        child: Transform.rotate(angle: -pi / 5, child: containerBox));

    return Stack(
      children: [
        gradiente,
        pinkBox,
      ],
    );
  }

  Widget _buildSingleColumScroll() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTitles(),
          _buildBottonsTable(),
        ],
      ),
    );
  }

  Widget _buildTitles() {
    final textStyleTitle = TextStyle(
        color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold);
    final textStyleSubTitle = TextStyle(color: Colors.white, fontSize: 18.0);

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Clasified transaction',
          style: textStyleTitle,
        ),
        SizedBox(height: 10.0),
        Text(
          'Clasified this transaction in particular operation with your card.',
          style: textStyleSubTitle,
        ),
      ],
    );

    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(20.0),
      child: column,
    ));
  }

  Widget _buildBottonNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(
                color: Color.fromRGBO(116, 117, 152, 1.0),
              ))),
      child: BottomNavigationBar(
        items: [
          _buildBottonNavigationItem(Icons.calendar_today, ''),
          _buildBottonNavigationItem(Icons.bubble_chart, ''),
          _buildBottonNavigationItem(Icons.supervised_user_circle, ''),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottonNavigationItem(
      IconData icon, String text) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: text,
    );
  }

  Widget _buildBottonsTable() {
    return Table(
      children: [
        _buildTableRowItem(Colors.blue, Colors.deepPurple, Icons.border_all,
            Icons.directions_bus, 'General', 'Bus'),
        _buildTableRowItem(Colors.pinkAccent, Colors.orange, Icons.shop,
            Icons.insert_drive_file, 'Buy', 'File'),
        _buildTableRowItem(Colors.blueAccent, Colors.green, Icons.movie_filter,
            Icons.cloud, 'Entertaiment', 'Cloud'),
        _buildTableRowItem(Colors.red, Colors.teal, Icons.collections,
            Icons.help_outline, 'Photos', 'Help'),
      ],
    );
  }

  TableRow _buildTableRowItem(Color colorRow1, Color colorRow2,
      IconData iconRow1, IconData iconRow2, String textRow1, String textRow2) {
    return TableRow(children: [
      _buildRoundButton(colorRow1, iconRow1, textRow1),
      _buildRoundButton(colorRow2, iconRow2, textRow2),
    ]);
  }

  Widget _buildRoundButton(Color color, IconData icon, String text) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          margin: EdgeInsets.all(15.0),
          height: 180.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: _buildButtonColumn(color, icon, text),
        ),
      ),
    );
  }

  Widget _buildButtonColumn(Color color, IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 5.0),
        CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
            size: 30.0,
          ),
          radius: 35.0,
        ),
        Text(text, style: TextStyle(color: color)),
        SizedBox(height: 5.0),
      ],
    );
  }
}
