import 'package:flutter/material.dart';
import 'package:quiz_app/model/model.dart';
import 'package:quiz_app/screens/result_screen.dart';

class QuizSetScreen extends StatefulWidget {
  final Category category;
  final QuizSet quizset;

  const QuizSetScreen({
    Key? key,
    required this.category,
    required this.quizset,
  }) : super(key: key);

  @override
  _QuizSetScreenState createState() => _QuizSetScreenState();
}

class _QuizSetScreenState extends State<QuizSetScreen> {
  int currentQuestionsIndex = 0;
  List<int?> selectedAnswers = [];
  var teamColor;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<int?>.filled(widget.quizset.questions.length, null);
    teamColor = widget.category.color;
  }

// bulunalan soru toplam soru sayısından bir eksikse soru ilerletilebilir
  void goToNextQuestion() {
    if (currentQuestionsIndex < widget.quizset.questions.length - 1) {
      setState(() {
        currentQuestionsIndex++;
      });
    }
  }

  //bulunulan soru 1 den büyükse yani en az 1 soru yapıldıysa  sorularda geriye gidilebilir
  void goToPreviousQuestion() {
    if (currentQuestionsIndex > 0) {
      setState(() {
        currentQuestionsIndex--;
      });
    }
  }

//tüm soru sayısı kadar (her sette 10 soru var) kontrol işlemi yapılarak seçilen soru data.dart dosyasındaki selectedIteme eşitse doğru sayısında arttırma işlemi
  void submitQuiz() {
    int totalCorrect = 0;
    for (int i = 0; i < widget.quizset.questions.length; i++) {
      if (selectedAnswers[i] ==
          widget.quizset.questions[i].correctAnswerIndex) {
        totalCorrect++;
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          totalCorrect: totalCorrect,
          totalQuestions: widget.quizset.questions.length,
          totalAttempts: widget.quizset.questions.length,
          totalScore: totalCorrect * 10,
          quizSet: widget.quizset,
          category: widget.category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion =
        widget.quizset.questions[currentQuestionsIndex];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 31, 31, 31),
              Color.fromARGB(255, 31, 31, 31),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.quizset.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentQuestion.question,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: teamColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...currentQuestion.options.asMap().entries.map(
                    (entry) {
                      final index = entry.key;
                      final option = entry.value;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAnswers[currentQuestionsIndex] = index;
                          });
                        },
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: selectedAnswers[currentQuestionsIndex] ==
                                      index
                                  ? Colors.indigo
                                  : Colors.white,
                              border: Border.all(
                                width: 2,
                                color: selectedAnswers[currentQuestionsIndex] ==
                                        index
                                    ? Colors.indigo
                                    : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              option,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedAnswers[currentQuestionsIndex] ==
                                        index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentQuestionsIndex > 0)
                    ElevatedButton(
                      onPressed: goToPreviousQuestion,
                      child: Text(
                        "Back",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  else
                    SizedBox(),
                  ElevatedButton(
                    onPressed: () {
                      if (currentQuestionsIndex <
                          widget.quizset.questions.length - 1) {
                        goToNextQuestion();
                      } else {
                        submitQuiz();
                      }
                    },
                    child: Text(
                      currentQuestionsIndex ==
                              widget.quizset.questions.length - 1
                          ? "Submit"
                          : "Next",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
