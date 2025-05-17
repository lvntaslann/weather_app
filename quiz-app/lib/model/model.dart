// model.dart

import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;
  final List<QuizSet> quizSets;
  final Color color;

  Category({
    // takım ismi takım logosu takım soru çeşidi(veri her bir takım için 3 farklı soru sayfası olacak şekilde ayarlandı) ve her bir takım için kendine as renk türleri
    required this.name,
    required this.image,
    required this.quizSets,
    required this.color,
  });
}

class QuizSet {
  final String name;
  final List<Question> questions;

  QuizSet({required this.name, required this.questions});
}

class Question {
  String question;
  List<String> options;
  int correctAnswerIndex;
  int selectedIndex;

  Question(
    this.question,
    this.options,
    this.correctAnswerIndex, {
    this.selectedIndex = -1,
  });
}
