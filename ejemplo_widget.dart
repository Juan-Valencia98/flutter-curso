import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter Ejemplo")),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        scrollDirection : Axis.vertical,
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.amber,
            child: const Center(
              child: Text('Amarillo'),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 5,
            indent: 20,
            endIndent: 0,
            color: Colors.red,
          ),
          // Subheader example from Material spec.
          // https://material.io/components/dividers#types
          Container(
            padding: const EdgeInsets.only(left: 40),
            color: Colors.yellow,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Texto',
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Container(
            height: 100,
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              children: [
                Container(
                  width: 100,
                  color: Colors.red,
                  child: ListView(
                    children: [
                      Container(
                        height: 50,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 50,
                        color: Colors.white,
                      ),
                      Container(
                        height: 50,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.white
                ),
              ],
            ),
          ),
          Image.network(
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
          ),
        ],
      ),
    );
  }
}
