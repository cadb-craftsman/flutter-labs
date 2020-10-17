import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String _optionSelected = 'Fly';
  List<String> _powers = ['Force', 'Rayos X', 'Fly', 'Run'];

  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counter: Text('Words ${_name.length}'),
          hintText: 'Person name',
          labelText: 'Name',
          helperText: 'Text Name',
          suffix: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          labelText: 'Email',
          suffix: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          suffix: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          hintText: 'Birth Date',
          labelText: 'Birth Date',
          suffix: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = new List();

    _powers.forEach((power) {
      list.add(DropdownMenuItem(value: power, child: Text(power)));
    });
    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _optionSelected,
          items: getDropdownOptions(),
          onChanged: (opt) {
            setState(() {
              _optionSelected = opt;
            });
          },
        )
      ],
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: new Locale('es', ''));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _textEditingController.text = _date;
      });
    }
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_optionSelected),
    );
  }
}
