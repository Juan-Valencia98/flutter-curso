import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTILIZANDO LIBRERIAS',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Librerías externas",
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              Fluttertoast.showToast(
                msg: "Mensaje desde Fluttertoast",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.amber,
                textColor: Colors.black,
                fontSize: 25.0
              );
            }, 
            child: Text('Mostrar Toast'),
          ),
        ),
      ),
    );
  }
}
