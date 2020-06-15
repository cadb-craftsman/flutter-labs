main(List<String> args) {

  Perro p = new Perro();
  p.nombre = 'Firulais';
  p.emitirSonido();

  Gato g = new Gato();
  g.nombre = 'Gardfield';
  g.emitirSonido();

}

abstract class Animal{

  String nombre;
  void emitirSonido();

}

class Perro implements Animal{

  String nombre;
  void emitirSonido() => print('GUAUUUU!!!');

}

class Gato implements Animal{

  String nombre;
  void emitirSonido() => print('MIAUUUU!!!');

}