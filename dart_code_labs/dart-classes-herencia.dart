main(List<String> args) {

Heroe h = new Heroe();
h.nombre = 'Batman';
h.poder = 'Murcielago';
h.valentia = 9;

Villano v = new Villano();
v.nombre = 'Jocker';
v.poder = 'Risas';
v.maldad = 8;

}

abstract class Personaje{

  String nombre;
  String poder;

}

class Heroe extends Personaje{

  int valentia;

}

class Villano extends Personaje{

  int maldad;

}