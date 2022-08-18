import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//////////////////////////// W I D G E T S //////////////////////////////
class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> operators = ["+", "-", "×", "÷"];
  List<String> hist = [];
  String history = "0", output = "0";
  var answer = 0.0;
  void click1() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "1";
      } else {
        output = "1";
      }
    });
  }

  void click2() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "2";
      } else {
        output = "2";
      }
    });
  }

  void click3() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "3";
      } else {
        output = "3";
      }
    });
  }

  void click4() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "4";
      } else {
        output = "4";
      }
    });
  }

  void click5() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "5";
      } else {
        output = "5";
      }
    });
  }

  void click6() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "6";
      } else {
        output = "6";
      }
    });
  }

  void click7() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "7";
      } else {
        output = "7";
      }
    });
  }

  void click8() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "8";
      } else {
        output = "8";
      }
    });
  }

  void click9() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "9";
      } else {
        output = "9";
      }
    });
  }

  void click0() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "0";
      } else {
        output = "0";
      }
    });
  }

  void clickDot() {
    setState(() {
      output += ".";
    });
  }

  void clear() {
    setState(() {
      history = "";
      output = "0";
      answer = 0.0;
      hist = [];
    });
  }

  void sign() {
    setState(() {
      if (double.parse(output) == 0.0) {
      } else {
        if (output[0] == '-') {
          output = output.substring(1);
        } else {
          output = '-' + output;
        }
      }
    });
  }

  void percent() {
    setState(() {
      double percent = 0.0;
      percent = answer / 100;
      history = answer.toString() + " ÷ 100 =";
      output = percent.toString();
    });
  }

  String getTape() {
    return hist.join(" ");
  }

  bool isOperator(String s) {
    return (operators.contains(s));
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s) != null;
  }

  void equals() {
    setState(() {
      if (hist.length <= 3) {
        hist.add(output);
      }
      history = getTape() + " =";
      var opr1, opr2, op;
      opr1 = double.parse(hist.removeAt(0));
      op = hist.removeAt(0);
      opr2 = double.parse(hist.removeAt(0));
      switch (op) {
        case "+":
          answer = opr1 + opr2;
          break;
        case "-":
          answer = opr1 - opr2;
          break;
        case "×":
          answer = opr1 * opr2;
          break;
        case "÷":
          answer = opr1 / opr2;
          break;
        default:
      }
      output = answer.toString();
      hist.insert(0, answer.toString());
    });
  }

  void add() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("+");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  void sub() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("-");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  void div() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("÷");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  void mul() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("×");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent.shade400,
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25.0, right: 15.0),
                child: Text(
                  history,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, right: 15.0, bottom: 15.0),
                child: Text(
                  "$output",
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: clear,
                        child: Icon(
                          Icons.block,
                          size: 35.0,
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.deepOrangeAccent.shade400,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: sign,
                        child: Text(
                          "±",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.deepOrangeAccent.shade400,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: percent,
                        child: Text(
                          "%",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.deepOrangeAccent.shade400,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: div,
                        child: Text(
                          "÷",
                          style: TextStyle(
                              fontSize: 35.0,
                              color: Colors.deepOrangeAccent.shade400,
                              fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        highlightColor: Colors.deepOrangeAccent.shade400,
                        splashColor: Colors.red[100],
                        padding: const EdgeInsets.all(15.0),
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: click1,
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: click2,
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: click3,
                        child: Text(
                          "3",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: mul,
                        child: Text(
                          "×",
                          style: TextStyle(
                              fontSize: 35.0,
                              color: Colors.red[700],
                              fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        highlightColor: Colors.red[100],
                        splashColor: Colors.red[100],
                        padding: const EdgeInsets.all(15.0),
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: click4,
                        child: Text(
                          "4",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: click5,
                        child: Text(
                          "5",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: click6,
                        child: Text(
                          "6",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: sub,
                        child: Text(
                          "-",
                          style: TextStyle(
                              fontSize: 35.0,
                              color: Colors.red[700],
                              fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        highlightColor: Colors.red[100],
                        splashColor: Colors.red[100],
                        padding: const EdgeInsets.all(15.0),
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: click7,
                        child: Text(
                          "7",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: click8,
                        child: Text(
                          "8",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: click9,
                        child: Text(
                          "9",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: add,
                        child: Text(
                          "+",
                          style: TextStyle(
                              fontSize: 35.0,
                              color: Colors.red[700],
                              fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        highlightColor: Colors.red[100],
                        splashColor: Colors.red[100],
                        padding: const EdgeInsets.all(15.0),
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 5.0, bottom: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: click0,
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        constraints: BoxConstraints.tightFor(width: 170.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0)),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.only(
                            left: 18.0, top: 15.0, bottom: 15.0, right: 15.0),
                      ),
                      RawMaterialButton(
                        onPressed: clickDot,
                        child: Text(
                          ".",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.black45,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      RawMaterialButton(
                        onPressed: equals,
                        child: Text(
                          "=",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w500),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.deepOrangeAccent.shade400,
                        padding: const EdgeInsets.all(15.0),
                      )
                    ]),
              ),
            ]),
      ),
    );
  }
}

///////////////////////////// A P P  W I D G E T ///////////////////////////
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calcon",
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.deepOrange,
          brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}
