import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double _sliderValue = 50.0;
  bool _blockCheck = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(
              child: _createImage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      value: _sliderValue,
      label: 'Slider value: $_sliderValue',
      divisions: 10,
      activeColor: Colors.indigo,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck)
          ? null
          : (double value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _createCheckBox() {
    /*
    return Checkbox(value: _blockCheck, onChanged: (value){
      setState(() {
        _blockCheck = value;
      });
    });
     */
    return CheckboxListTile(
        title: Text('Block slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }

  Widget _createSwitch() {
    /*
    return Switch(
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = !_blockCheck;
          });
        });
     */
    return SwitchListTile(
        title: Text('Block slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://e7.pngegg.com/pngimages/992/97/png-clipart-batman-illustration-batman-superhero-legion-of-super-heroes-character-breakfast-comics-heroes.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
