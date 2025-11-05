import 'package:flutter/material.dart';

// Punto de entrada principal de la aplicación
void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Oculta el banner de debug
    home: const MyApp(), // Página principal
  ),
);

// Widget principal del login
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Permite hacer scroll si la pantalla es pequeña
        child: Column(
          children: <Widget>[
            // SECCIÓN SUPERIOR: Fondo con imágenes decorativas y título "Login"
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://raw.githubusercontent.com/afgprogrammer/Flutter-Login-Page-UI/master/assets/images/background.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  // Luz decorativa izquierda
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://raw.githubusercontent.com/afgprogrammer/Flutter-Login-Page-UI/master/assets/images/light-1.png',
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Luz decorativa central
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://raw.githubusercontent.com/afgprogrammer/Flutter-Login-Page-UI/master/assets/images/light-2.png',
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Imagen del reloj (decorativo)
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://raw.githubusercontent.com/afgprogrammer/Flutter-Login-Page-UI/master/assets/images/clock.png',
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Texto principal del encabezado
                  Positioned(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // SECCIÓN INFERIOR: FORMULARIO DE LOGIN
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  // Caja de texto con sombra (campo usuario + contraseña)
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        // Campo de texto: usuario o email
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email or Phone number",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: const Icon(Icons.email_outlined, color: Colors.blueAccent),
                            ),
                          ),
                        ),

                        // Campo de texto: contraseña
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: true, // Oculta la contraseña
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: const Icon(Icons.lock_outline, color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Botón principal de Login con gradiente
                  GestureDetector(
                    onTap: () {
                      // Aquí se puede añadir la lógica de autenticación
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login button pressed')),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .4),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 70),

                  // Texto inferior (recuperar contraseña)
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color.fromRGBO(143, 148, 251, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
