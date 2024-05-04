import 'package:flutter/material.dart';
import 'package:juego_gato/screens/ticTacToeGame.dart';
import 'package:juego_gato/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de Gato',
      initialRoute: '/',
      routes: {
        '/ticTacToeBoard': (context) => const TicTacToeGame(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            secondary: Colors.red,
            primary: Colors.green
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}