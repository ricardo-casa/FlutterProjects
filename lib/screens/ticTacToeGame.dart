import 'package:flutter/material.dart';
import '../components/gameBoard.dart';

class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({Key? key}) : super(key: key);

  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  final List<List<String>> _board = List.generate(3, (_) => List.filled(3, ''));
  final List<String> _players = ['X', 'O'];
  int _currentPlayer = 0;
  late String playerOneName;
  late String playerTwoName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ?? <String, dynamic>{};
    playerOneName = arguments['name1'] ?? "Jugador 1";
    playerTwoName = arguments['name2'] ?? "Jugador 2";
  }

  int _getCurrentPlayerTurn() => _currentPlayer % 2;

  String _checkWinner() {
    String currentPlayerName = _getCurrentPlayerTurn() == 0 ? playerTwoName : playerOneName;

    // Verificar filas
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] != '' &&
          _board[i][0] == _board[i][1] &&
          _board[i][0] == _board[i][2]) {
        return currentPlayerName; // Retorna el nombre del ganador
      }
    }

    // Verificar columnas
    for (int i = 0; i < 3; i++) {
      if (_board[0][i] != '' &&
          _board[0][i] == _board[1][i] &&
          _board[0][i] == _board[2][i]) {
        return currentPlayerName; // Retorna el nombre del ganador
      }
    }

    // Verificar diagonales
    if (_board[0][0] != '' &&
        _board[0][0] == _board[1][1] &&
        _board[0][0] == _board[2][2]) {
      return currentPlayerName; // Retorna el nombre del ganador
    }
    if (_board[0][2] != '' &&
        _board[0][2] == _board[1][1] &&
        _board[0][2] == _board[2][0]) {
      return currentPlayerName; // Retorna el nombre del ganador
    }

    // Si no hay ganador
    return '';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turno de ${_getCurrentPlayerTurn() == 0 ? playerOneName : playerTwoName}'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          children: [
            TicTacToeBoard(
              board: _board,
              onPressed: (row, cell) {
                setState(() {
                  if (_board[row][cell] == '') {
                    _board[row][cell] = _players[_currentPlayer % 2];
                    _currentPlayer++;
                    print('TABLERO ACTUAL: $_board');
                    String winner = _checkWinner();
                    if (winner.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('¡Felicidades!'),
                          content: Text('$winner ha ganado el juego.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _resetGame();
                              },
                              child: Text('Volver a Jugar'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                });
              },
              currentPlayer: _getCurrentPlayerTurn(),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: _resetGame,
              child: const Text('Volver a Jugar'),
            ),
          ],
        ),
      ),
    );
  }

  void _resetGame() {
    setState(() {
      _board.forEach((row) {
        row.fillRange(0, row.length, '');
      });
      _currentPlayer = 0;
    });
  }
}
