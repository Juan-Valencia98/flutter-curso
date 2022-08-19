import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
        appBar: AppBar(
          title: const Text("Hola Mundo"),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.alarm_add,
                color: Colors.green,
                size: 35.0,
              ),
              Container(
                child: Text("CALL"),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 35.0,
              ),
              Container(
                width: 50,
                height: 30,
                child: Center(
                  child: Text("Call")
                ),
              ),
            ],
          ),
          Column(
            children: [
               Icon(
                Icons.beach_access,
                color: Colors.brown,
                size: 35.0,
              ),
              Container(
                color: Colors.red,
                width: 50,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
