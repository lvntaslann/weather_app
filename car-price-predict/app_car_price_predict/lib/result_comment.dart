class ResultComment {
  String resultComment(String predict, String kilometre, String yil) {
    var numPredict = double.parse(predict);
    var km = int.parse(kilometre);
    var aracYasi = 2024 - int.parse(yil);

    if (aracYasi > 15 && km > 300000 && numPredict > 3200) {
      return "Bu araç, ${aracYasi} yaşında ve ${km} kilometrede olduğu için alınmamalıdır.";
    } else if (aracYasi <= 15 &&
        aracYasi > 10 &&
        km > 200000 &&
        numPredict > 5000) {
      return "Bu araç, ${aracYasi} yaşında ve ${km} kilometrede olduğu için alınmamalıdır.";
    } else if (aracYasi <= 10 &&
        aracYasi > 5 &&
        km > 120000 &&
        numPredict > 6200) {
      return "Bu araç, ${aracYasi} yaşında ve ${km} kilometrede olduğu için alınmamalıdır.";
    } else {
      return "Bu araç, ${aracYasi} yaşında ve ${km} kilometrede olduğu için alınabilir.";
    }
  }
}
