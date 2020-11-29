import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:badnames_app/src/domain/model/band.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 50),
    Band(id: '2', name: 'Mana', votes: 51),
    Band(id: '3', name: 'Heroes del silencio', votes: 35),
    Band(id: '4', name: 'Bon Jovi', votes: 25),
    Band(id: '5', name: 'Blind', votes: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('BandNames', style: TextStyle(color: Colors.black87)),
      backgroundColor: Colors.white,
      elevation: 1,
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: bands.length,
      itemBuilder: (context, index) => _buildDismissible(bands[index]),
    );
  }

  Widget _buildDismissible(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('band id ${band.id}');
        //TODO Llamar el borrado en el server
      },
      background: Container(
          padding: EdgeInsets.only(left: 8.0),
          color: Colors.red,
          child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('Delete Band', style: TextStyle(color: Colors.white)))),
      child: _buildListTile(band),
    );
  }

  ListTile _buildListTile(Band band) {
    return ListTile(
      title: Text(band.name),
      trailing: Text('${band.votes}', style: TextStyle(fontSize: 20)),
      leading: _buildCircleAvatar(band),
      onTap: () {
        print('Band: ${band.name}');
      },
    );
  }

  CircleAvatar _buildCircleAvatar(Band band) {
    return CircleAvatar(
      child: Text(band.name.substring(0, 2)),
      backgroundColor: Colors.blue[100],
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      elevation: 1,
      onPressed: () {
        addNewBand(context);
      },
    );
  }

  addNewBand(BuildContext context) {
    final textEditingController = TextEditingController();

    if (!Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => _buildAlertDialogAndroid(textEditingController),
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => _buildAlertDialogIOs(textEditingController),
      );
    }
  }

  AlertDialog _buildAlertDialogAndroid(
      TextEditingController textEditingController) {
    return AlertDialog(
      title: Text('New band name:'),
      content: TextField(
        controller: textEditingController,
      ),
      actions: [
        MaterialButton(
            child: Text('Add'),
            elevation: 5,
            textColor: Colors.blue,
            onPressed: () {
              addBandToBands(textEditingController.text);
            }),
      ],
    );
  }

  CupertinoAlertDialog _buildAlertDialogIOs(
      TextEditingController textEditingController) {
    return CupertinoAlertDialog(
      title: Text('New band name:'),
      content: CupertinoTextField(
        controller: textEditingController,
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Add'),
          onPressed: () {
            addBandToBands(textEditingController.text);
          },
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: Text('Dismiss'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void addBandToBands(String name) {
    if (name.length > 1) {
      bands.add(
          new Band(id: (bands.length + 1).toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
