//nesnesi türetilemez
// normal sınıf oluşturup nesnesini türetseydik Işık mı ? Termostat mı ? Speaker mı ? bilemezdik
// abstract base class olara kullanılacaksa mantıklı...
abstract class SmartDevice{
  final String id;
  final String name;
  bool isOn;

  SmartDevice({
    required this.id,
    required this.name,
    this.isOn =false,
  });

  void togglePower(){
    isOn = !isOn;
  }
}