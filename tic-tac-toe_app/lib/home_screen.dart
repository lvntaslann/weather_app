import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter player name",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: takeUserName(context, player1Controller, "Player 1 name"),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: takeUserName(context, player2Controller, "Player 2 name"),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GameScreen(
                              player1: player1Controller.text,
                              player2: player2Controller.text)));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                child: Text(
                  "Start Game",
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

  TextFormField takeUserName(
      BuildContext context, TextEditingController player, String hintText) {
    return TextFormField(
      controller: player,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF40E0D0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          if (player.text.isNotEmpty) {
            showDialogGonder(
                context, player == player1Controller ? "Player 1" : "Player 2");
          }
          return "Please enter a name";
        } else {
          return null;
        }
      },
    );
  }

  void showDialogGonder(BuildContext context, String player) {
    var alert = AlertDialog(
      content: Text("Please enter ${player}'s name"),
      title: Text("Error"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
  }
}
