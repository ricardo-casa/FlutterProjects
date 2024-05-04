import 'package:flutter/material.dart';
import '../components/gameBoard.dart';

class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({super.key});

  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  final List<List<String>> _board = List.generate(3, (_) => List.filled(3, ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego en curso'),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(children: [
            TicTacToeBoard(
              board: _board,
              onPressed: (row, cell) {
                print('Celda presionada: ${_board[row][cell]}');
                setState(() {
                  _board[row][cell] = 'X';
                });
              },
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                print("Volver a Jugar");
              },
              child: const Text('Volver a Jugar'),
            ),
          ])),
    );
  }
}
