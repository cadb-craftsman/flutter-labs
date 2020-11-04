import 'package:flutter/material.dart';

class BasicDesign extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final subTitleStyle = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: _buildMainColumn(),
      ),
    ));
  }

  Widget _buildMainColumn() {
    return Column(
      children: [
        _buildImage(),
        _buildTextContainer(),
        _buildActionRow(),
        _buildContainerText(),
        _buildContainerText(),
        _buildContainerText(),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
        width: double.infinity,
        child: Image(
          image: NetworkImage(
              'https://www.goodfreephotos.com/albums/other-landscapes/rover-and-landscape-scenery.jpg'),
          height: 150.0,
          fit: BoxFit.cover,
        ));
  }

  Widget _buildTextContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(child: _buildTextColumn()),
          Icon(Icons.star, color: Colors.red, size: 30.0),
          Text(
            '41',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  Widget _buildTextColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Imagen de lago', style: titleStyle),
        SizedBox(height: 7.0),
        Text('Un lago en Holanda', style: subTitleStyle)
      ],
    );
  }

  Widget _buildActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildColumnAction(Icons.call, 'Call'),
        _buildColumnAction(Icons.near_me, 'Router'),
        _buildColumnAction(Icons.share, 'Share'),
      ],
    );
  }

  Widget _buildColumnAction(IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30.0,
        ),
        SizedBox(height: 10.0),
        Text(
          text,
          style: TextStyle(fontSize: 15.0, color: Colors.blue),
        )
      ],
    );
  }

  Widget _buildContainerText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        '¿Qué es Lorem Ipsum? Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
