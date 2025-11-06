import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formularios en Flutter',
      home: FormularioPage(),
    );
  }
}

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario básico',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Por favor, ingresa tu nombre';
                  }
                  // Si todo esta bien
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Celular',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Por favor, ingresa tu nombre';
                  }
                  // Si todo esta bien
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Bienvenido, ${_nombreController.text}"))
                    );
                  }
                }, 
                child: Text('Enviar')
              ),
            ],
          )
        ),
      ),
    );
  }
}
