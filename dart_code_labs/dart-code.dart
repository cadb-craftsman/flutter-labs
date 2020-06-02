import 'dart:convert';

void main(List<String> args) {
  print('Hola Mundo Dart');

  Heroe h = Heroe(nombre: 'Xavier', poder: 'Control Mental');
  print('$h');

  final rawJson = '{"nombre": "Logan", "poder": "Regeneración"}';
  Map parsedJson = json.decode(rawJson);

  Heroe hJson = Heroe.fromJson(parsedJson);
  print('$hJson');
}


class Heroe{

String nombre;
String poder;

/*
  Heroe({String nombre = 'Anonimo', String poder = 'Oculto'}){
    this.nombre = nombre;
    this.poder = poder;
  }
*/
  Heroe({this.nombre = 'Anonimo', this.poder = 'Oculto'});

  Heroe.fromJson(Map parsedJson){
    nombre = parsedJson['nombre'];
    poder = parsedJson['poder'];
  }

/*
  String toString(){
    return '${this.nombre} - ${this.poder}';
  }
*/
  toString() => '$nombre - $poder';

}