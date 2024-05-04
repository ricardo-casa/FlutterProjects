import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de Gato'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Center(
            child: Column(
              children: [
                const Image(image: AssetImage('assets/gato.jpg'), width: 130, height: 130, fit: BoxFit.cover),
                const SizedBox(height: 100),
                const Text(
                    "Ingresa el nombre del jugador uno",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre del Jugador Uno',
                    contentPadding: EdgeInsets.all(10),
                    constraints: BoxConstraints(
                      maxHeight: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                    "Ingresa el nombre del jugador dos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre del Jugador Dos',
                    contentPadding: EdgeInsets.all(10),
                    constraints: BoxConstraints(
                      maxHeight: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/ticTacToeBoard');
                      },
                      child: const Text("Iniciar Juego", style: TextStyle(color: Colors.white))
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}