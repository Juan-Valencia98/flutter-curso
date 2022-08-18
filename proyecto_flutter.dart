import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: const <Widget>[
              Text("Setting"),
              Text("About"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.facebook),
        ),
        appBar: AppBar(
          title: Text("Hola Mundo"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(color: Colors.red),
            ),
            Expanded(
              flex: 1,
              child: Container(color: Colors.green),
            ),
            Expanded(
              flex: 1,
              child: Container(color: Colors.blue),
            ),
            Expanded(
              flex: 1,
              child: Container(color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
