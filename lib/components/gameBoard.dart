import "package:flutter/material.dart";

class TicTacToeBoard extends StatelessWidget {
  final List<List<String>> board;
  final void Function(int row, int cell) onPressed;

  const TicTacToeBoard({
    super.key,
    required this.board,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: board.asMap().entries.map((row) {
        return Row(
          children: row.value.asMap().entries.map((cell) {
            return Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color:
                              row.key == 0 ? Colors.transparent : Colors.black),
                      left: BorderSide(
                          color: cell.key == 0
                              ? Colors.transparent
                              : Colors.black),
                      right: BorderSide(
                          color: cell.key == 2
                              ? Colors.transparent
                              : Colors.black),
                      bottom: BorderSide(
                          color:
                              row.key == 2 ? Colors.transparent : Colors.black),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () => onPressed(row.key, cell.key),
                    child: Text(
                      cell.value,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
