import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/model/model.dart';
import 'package:quiz_app/screens/quiz_set_screen.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int totalAttempts;
  final int totalCorrect;
  final int totalScore;
  final QuizSet quizSet;
  final Category category;
  //quiz_set_screen.dart dosyasından navigator push yöntemiyle verilerin aktarımı sağlanıyor
  const ResultScreen({
    Key? key,
    required this.totalQuestions,
    required this.totalAttempts,
    required this.totalCorrect,
    required this.totalScore,
    required this.quizSet,
    required this.category,
  }) : super(key: key);

// total scora göre puanlandırma
  String getResultMessage() {
    if (totalScore < 30) {
      return "You failed";
    } else if (totalScore < 60) {
      return "Great";
    } else if (totalScore < 80) {
      return "Awesome";
    } else {
      return "Excellent";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 31, 31, 31),
                Color.fromARGB(255, 35, 35, 35),
              ]),
            ),
            child: Center(
              child: Lottie.network(
                "https://lottie.host/e6844d14-5be9-4cdb-8399-9bc9d544af8b/0T9kFuft3y.json",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                frameBuilder: (context, child, composition) {
                  return Container(
                    color: Color.fromARGB(255, 31, 31, 31),
                    child: child,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 31, 31, 31),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getResultMessage(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: totalScore < 30 ? Colors.red : Colors.green,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${totalScore} / ${totalQuestions * 10}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizSetScreen(
                                quizset: quizSet,
                                category: category,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Repeat',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          shadowColor: Colors.black,
                          elevation: 10,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: Text(
                          'Homepage',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          shadowColor: Colors.black,
                          elevation: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
