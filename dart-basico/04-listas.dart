void main() {
  
//   Map persona = {
//     'nombre': 'Fernando',
//     'edad': 35,
//     'soltero': false,
//     true: false,
//     1: 100,
//     2: 500
//   };
  
  List<Map<String, dynamic>> persona = [
    {
      'nombre': 'Fernando',
      'edad': 35,
      'soltero': false,
    },
    {
      'nombre': 'Juan',
      'edad': 21,
      'soltero': true,
    },
                                       
                                       ];
  
  persona.addAll([{
      'nombre': 'Carlos',
      'edad': 35,
      'soltero': false,
  }]);
  for(var lista in persona){
    print(lista['nombre']);
  }
  print(persona[0]['nombre']);
  print( persona );
}
