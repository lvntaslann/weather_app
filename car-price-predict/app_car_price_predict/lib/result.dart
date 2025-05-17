import 'package:araba_fiyat_tahimini/result_comment.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Result extends StatefulWidget {
  final String prediction;
  final String yil;
  final String kiloMetre;
  const Result(
      {Key? key,
      required this.prediction,
      required this.kiloMetre,
      required this.yil})
      : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var resultComment = ResultComment();
  @override
  Widget build(BuildContext context) {
    String result = resultComment.resultComment(
        widget.prediction, widget.kiloMetre, widget.yil);
    String lottieAnimUrl = result.contains("alınabilir")
        ? "https://lottie.host/10b3944f-3190-4f65-9162-cfd7203dd3fd/vJTXGoMrPA.json"
        : "https://lottie.host/2e3b9e1c-6390-48b4-bed9-6865a5d278b7/BCk3Hh1IAy.json";

    Color getColor(String result) {
      return result.contains("alınabilir") ? Colors.green : Colors.red;
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          children: [
            LottieBuilder.network(lottieAnimUrl),
            _buildResult(result, getColor),
          ],
        ),
      ),
    );
  }

  Column _buildResult(String result, Color getColor(String result)) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Tahmini Araç Fiyatı',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          "${widget.prediction}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 100,
        ),
        Text(
          "Sonuç: ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$result",
          style: TextStyle(
            color: getColor(result),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Tahmin Sonucu'),
      backgroundColor: Colors.cyanAccent,
    );
  }
}
