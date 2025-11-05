import 'package:flutter/material.dart';

// Punto de entrada principal de la aplicación Flutter
// runApp() inicia la app y muestra el widget MyApp como raízoid main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}
//////////////////////////// W I D G E T S //////////////////////////////

// HomePage es un StatefulWidget porque su estado cambia con cada pulsación de botón
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => HomePageState();
}

// Estado de la página principal donde se manejan los cálculos y actualizaciones de pantalla
class HomePageState extends State<HomePage> {
  // Lista de operadores válidos
  List<String> operators = ["+", "-", "×", "÷"];
  // Historial de operaciones
  List<String> hist = [];
  String history = "0", output = "0";
  var answer = 0.0; // Resultado numérico

  //////////////////////////// FUNCIONES DE BOTONES NUMÉRICOS ////////////////////////////

  // Cada función clickX actualiza la salida dependiendo si hay un número previo distinto de 0
  void click1() => _appendNumber("1");
  void click2() => _appendNumber("2");
  void click3() => _appendNumber("3");
  void click4() => _appendNumber("4");
  void click5() => _appendNumber("5");
  void click6() => _appendNumber("6");
  void click7() => _appendNumber("7");
  void click8() => _appendNumber("8");
  void click9() => _appendNumber("9");
  void click0() => _appendNumber("0");

  // Método auxiliar para reducir repetición de código en los clicks numéricos
  void _appendNumber(String number) {
    setState(() {
      if (double.tryParse(output) != 0.0) {
        output += number;
      } else {
        output = number;
      }
    });
  }

  //////////////////////////// FUNCIONES ESPECIALES ////////////////////////////

  // Agregar punto decimal
  void clickDot() {
    setState(() {
      if (!output.contains('.')) {
        output += ".";
      }
    });
  }

  // Borrar todo (reinicia calculadora)
  void clear() {
    setState(() {
      history = "";
      output = "0";
      answer = 0.0;
      hist = [];
    });
  }

  // Cambiar signo del número actual (+/-)
  void sign() {
    setState(() {
      if (output != "0") {
        if (output.startsWith('-')) {
          output = output.substring(1);
        } else {
          output = '-$output';
        }
      }
    });
  }

  // Calcular porcentaje del resultado actual
  void percent() {
    setState(() {
      double percent = answer / 100;
      history = "$answer ÷ 100 =";
      output = percent.toString();
    });
  }

  //////////////////////////// FUNCIONES DE OPERACIÓN ////////////////////////////

  // Obtener toda la operación concatenada
  String getTape() => hist.join(" ");

  // Verificar si el símbolo es operador
  bool isOperator(String s) => operators.contains(s);

  // Calcular resultado final al presionar "="
  void equals() {
    setState(() {
      if (hist.length <= 3) hist.add(output);

      history = "${getTape()} =";

      // Extraemos operandos y operador
      var opr1 = double.parse(hist.removeAt(0));
      var op = hist.removeAt(0);
      var opr2 = double.parse(hist.removeAt(0));

      // Operación según el operador
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
      }

      // Mostrar resultado en pantalla
      output = answer.toString();
      hist.insert(0, answer.toString());
    });
  }

  // Funciones para cada operador (+, -, ×, ÷)
  void add() => _setOperation("+");
  void sub() => _setOperation("-");
  void div() => _setOperation("÷");
  void mul() => _setOperation("×");

  // Método genérico para reducir repetición entre operaciones
  void _setOperation(String operator) {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add(operator);

      if (hist.length >= 3) {
        output = "0";
        equals();
      }

      output = "0";
      history = getTape();
    });
  }

  //////////////////////////// INTERFAZ GRÁFICA ////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent.shade400,
        title: const Text('Calculadora'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Pantalla del historial
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 15.0),
            child: Text(
              history,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w200),
              textAlign: TextAlign.end,
            ),
          ),

          // Pantalla de salida (resultado actual)
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 15.0, bottom: 15.0),
            child: Text(
              output,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: const TextStyle(fontSize: 60.0, fontWeight: FontWeight.w100),
              textAlign: TextAlign.end,
            ),
          ),

          // Filas de botones — cada fila se agrupa en un Row con 4 botones
          _buildButtonRow([
            _iconButton(Icons.block, clear, Colors.deepOrangeAccent.shade400),
            _textButton("±", sign, Colors.deepOrangeAccent.shade400),
            _textButton("%", percent, Colors.deepOrangeAccent.shade400),
            _textButton("÷", div, Colors.white, textColor: Colors.deepOrangeAccent.shade400),
          ]),

          _buildButtonRow([
            _textButton("1", click1, Colors.black45),
            _textButton("2", click2, Colors.black45),
            _textButton("3", click3, Colors.black45),
            _textButton("×", mul, Colors.white, textColor: Colors.red[700]),
          ]),

          _buildButtonRow([
            _textButton("4", click4, Colors.black45),
            _textButton("5", click5, Colors.black45),
            _textButton("6", click6, Colors.black45),
            _textButton("-", sub, Colors.white, textColor: Colors.red[700]),
          ]),

          _buildButtonRow([
            _textButton("7", click7, Colors.black45),
            _textButton("8", click8, Colors.black45),
            _textButton("9", click9, Colors.black45),
            _textButton("+", add, Colors.white, textColor: Colors.red[700]),
          ]),

          _buildButtonRow([
            _wideButton("0", click0),
            _textButton(".", clickDot, Colors.black45),
            _textButton("=", equals, Colors.deepOrangeAccent.shade400),
          ]),
        ],
      ),
    );
  }

  //////////////////////////// MÉTODOS AUXILIARES PARA BOTONES ////////////////////////////

  // Crea un botón de texto genérico
  Widget _textButton(String text, VoidCallback onPressed, Color color, {Color? textColor}) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(15.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w500, color: textColor ?? Colors.white),
      ),
    );
  }

  // Crea un botón con ícono
  Widget _iconButton(IconData icon, VoidCallback onPressed, Color color) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(15.0),
      child: Icon(icon, size: 35.0),
    );
  }

  // Crea un botón ancho para el número 0
  Widget _wideButton(String text, VoidCallback onPressed) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 170.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
      elevation: 2.0,
      fillColor: Colors.black45,
      padding: const EdgeInsets.all(15.0),
      child: Text(text, style: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.w500)),
    );
  }

  // Construye una fila de botones
  Widget _buildButtonRow(List<Widget> buttons) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      ),
    );
  }
}

///////////////////////////// A P P  W I D G E T ///////////////////////////

// Widget raíz que configura el tema de la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora",
      theme: ThemeData(
        primarySwatch: Colors.red,
        hintColor: Colors.deepOrange,
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}
