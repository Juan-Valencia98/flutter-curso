import 'dart:math' as math;

void main() {
  
  final cuadrado = new Cuadrado( );
  
  cuadrado.area = 10;

  print( 'area get: ${ cuadrado.area }' );
}


class Cuadrado {
  
  double lado=0;  // lado * lado
   
  
  double get area {
    return this.lado;
  }
  
  set area( double lado ) {
    this.lado = lado;
  }
  
  
}
