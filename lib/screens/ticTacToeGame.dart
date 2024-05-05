import 'package:flutter/material.dart';
import '../components/gameBoard.dart';

class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({super.key});

  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  final List<List<String>> _board = List.generate(3, (_) => List.filled(3, ''));
  final List<String> _players = ['X', 'O'];
  int _currentPlayer = 0;

  int _getCurrentPlayerTurn() => _currentPlayer % 2;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    String playerOneName = arguments['name1'] ?? "Jugador 1";
    String playerTwoName = arguments['name2'] ?? "Jugador 2";
    String nameToDisplay = _getCurrentPlayerTurn() == 0 ? playerOneName : playerTwoName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Turno de $nameToDisplay'),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(children: [
            TicTacToeBoard(
              board: _board,
              onPressed: (row, cell) {
                print('Celda presionada: ${_board[row][cell]}');
                setState(() {
                  if (_board[row][cell] == '') {
                    _board[row][cell] = _players[_currentPlayer % 2];
                    _currentPlayer++;
                    print('TABLERO ACTUAL: $_board');
                  }
                });
              }, currentPlayer: _getCurrentPlayerTurn(),
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
