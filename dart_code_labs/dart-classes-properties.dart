main(List<String> args) {
  
  final c = new Cuadrado();
  c.largo = 1;

  print('$c');

}

class Cuadrado{

  double _largo;
  double _alto;

  set largo(double valor){
    if(valor <= 0){
      throw('El valor no puede ser inferior o igual a cero.');
    }
    _largo = valor;
  }

  get largo{
    return _largo;
  }

toString() => 'largo $_largo';

}