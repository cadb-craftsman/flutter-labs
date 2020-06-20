import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  /*
  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
   */
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  TextStyle _textStyleBody = TextStyle(fontSize: 20.0);
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Basics App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de clicks:',
              style: _textStyleBody,
            ),
            Text(
              '$_counter',
              style: _textStyleBody,
            )
          ],
        ),
      ),
      floatingActionButton: _createButtons()
    );
  }

  Widget _createButtons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0,),
        FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: _reset,
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: _remove,
        ),
        SizedBox(width: 5.0,),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _add,
        ),
      ],
    );
  }

  void _add(){
    setState(() {
      _counter += 1;
    });
  }

  void _remove(){
    setState(() {
      if(_counter <= 0){
        _counter = 0;
      }else{
        _counter -= 1;
      }
    });
  }

  void _reset(){
    setState(() {
      _counter = 0;
    });
  }
}
