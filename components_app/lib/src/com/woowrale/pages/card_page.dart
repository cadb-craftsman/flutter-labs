import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _buildCardOne(),
          SizedBox(height: 30.0),
          _buildCardTwo(),
          SizedBox(height: 30.0),
          _buildCardOne(),
          SizedBox(height: 30.0),
          _buildCardTwo(),
          SizedBox(height: 30.0),
          _buildCardOne(),
          SizedBox(height: 30.0),
          _buildCardTwo(),
          SizedBox(height: 30.0),
          _buildCardOne(),
          SizedBox(height: 30.0),
          _buildCardTwo(),
          SizedBox(height: 30.0),
          _buildCardOne(),
          SizedBox(height: 30.0),
          _buildCardTwo(),
          SizedBox(height: 30.0),
          _buildCardOne(),
          SizedBox(height: 30.0),
          _buildCardTwo(),
        ],
      ),
    );
  }

  Widget _buildCardOne() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text(
                'Subtitulo de la tarjeta, este texto se utiliza para mostrar en la tarjeta.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Ok'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCardTwo() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg'),
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          /*
          Image(
            image: NetworkImage(
                'https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg'),
          )*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Image downloading from the web'),
          ),
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10))
          ]),
    );
  }
}
