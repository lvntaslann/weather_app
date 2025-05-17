import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class GameScreen extends StatefulWidget {
  String player1;
  String player2;
  GameScreen({required this.player1, required this.player2});

  @override
  _GameScreenState createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> board;
  late String currentPlayer;
  late String winner;
  late bool gameOver;

  void initState() {
    super.initState();
    board = List.generate(3, (_) => List.generate(3, (_) => ""));
    currentPlayer = "X";
    winner = "";
    gameOver = false;
  }

  void resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.generate(3, (_) => ""));
      currentPlayer = "X";
      winner = "";
      gameOver = false;
    });
  }

  void makeMove(int row, int col) {
    if (board[row][col] != "" || gameOver) {
      return;
    }
    setState(() {
      board[row][col] = currentPlayer;
      /*
      [
              col0 col 1 col 2
       row 0  [0,   1,    2]
       row 1  [3,   4,    5]
       row 2  [6,   7,    8]
        satırdaki bir eleman seçili ise diğer sütunlar[0,1,2] o elemanla dolu ise kazanır
        sütündaki bir eleman seçili ise diğer satırlar[0,1,2] o elemanlar dolu iste kazanır
        çaprazlama da doluysa oyuncu kazanır
      ]
    */
      // Satır kontrolü
      if (board[row][0] == currentPlayer &&
          board[row][1] == currentPlayer &&
          board[row][2] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      }
      // Sütun kontrolü
      else if (board[0][col] == currentPlayer &&
          board[1][col] == currentPlayer &&
          board[2][col] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      }
      // Sol üstten sağ alta çapraz kontrol
      else if (board[0][0] == currentPlayer &&
          board[1][1] == currentPlayer &&
          board[2][2] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      }
      // Sağ üstten sol alta çapraz kontrol
      else if (board[0][2] == currentPlayer &&
          board[1][1] == currentPlayer &&
          board[2][0] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      }

      // Beraberlik kontrolü
      if (!board.any((row) => row.any((cell) => cell == ""))) {
        gameOver = true;
        winner = "It's a tie";
      }

      // Oyuncu değiştirme
      if (winner == "") {
        currentPlayer = currentPlayer == "X" ? "O" : "X";
      }

      // Oyun bittiğinde dialog gösterme
      if (winner != "") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(winner == "X"
                  ? widget.player1.toUpperCase() + " Won!"
                  : winner == "O"
                      ? widget.player2.toUpperCase() + " Won!"
                      : "It's a tie"),
              actions: <Widget>[
                TextButton(
                  child: Text("Play again"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetGame();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 110,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget("Turn: ", 25, Colors.white30),
                      TextWidget(
                        currentPlayer == "X"
                            ? widget.player1 + " ($currentPlayer)"
                            : widget.player2 + " ($currentPlayer)",
                        30,
                        currentPlayer == "X" ? Colors.red : Color(0xFF40E0D0),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 67, 67, 67),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(5),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () => makeMove(row, col),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 31, 31, 31),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            board[row][col],
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              color: board[row][col] == "X"
                                  ? Colors.red
                                  : Color(0xFF40E0D0),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                resetGame();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                child: Text(
                  "Reset Game",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text TextWidget(
    String text,
    double size,
    Color color,
  ) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
