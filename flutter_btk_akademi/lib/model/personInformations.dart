class PersonInformations {
  // Geç başlatılabileceği anlamında late kullanıldı
  late int id;
  late String name;
  late String surname;
  late int examNote;
  late String image;
  String _status = "";

  PersonInformations.withId(
      int id, String name, String surname, int examNote, String image) {
    this.id = id;
    this.name = name;
    this.surname = surname;
    this.examNote = examNote;
    this.image = image;
    _setStatus();
  }

  PersonInformations(String name, String surname, int examNote, String image) {
    this.name = name;
    this.surname = surname;
    this.examNote = examNote;
    this.image = image;
    _setStatus();
  }

  PersonInformations.withOutInfo() {
    this.id = 0;
    this.name = "";
    this.surname = "";
    this.examNote = 0;
    this.image =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2pC6k_GmKNjP79aEpJcZ-UgZRrFlskRrzNA&s";
    _setStatus();
  }

  // Durumu belirleyen özel yöntem
  void _setStatus() {
    if (this.examNote <= 49) {
      _status = "kaldı";
    } else {
      _status = "geçti";
    }
  }

  String get getStatus => _status;
}
