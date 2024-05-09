import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {"/page2": (context) => SecondPage()},
    );
  }
}

class HomePage extends StatelessWidget {
  // Controller para el campo de entrada
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de navegación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ingresa un valor',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String valorIngresado = _controller.text;
                Navigator.pushNamed(context, '/page2',
                    arguments: valorIngresado);
              },
              child: Text('Ir usando rutas'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String valorRecibido =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda página'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostrar el valor recibido
            Text('$valorRecibido'),
            SizedBox(height: 20),
            // Botón para regresar a la primera página
            ElevatedButton(
              onPressed: () {
                // Volver a la primera página
                Navigator.pop(context);
              },
              child: Text('Regresar a Tipos de navegación'),
            ),
          ],
        ),
      ),
    );
  }
}
