import 'package:flutter_example/model/pet.dart';

class Appointment {
  final String id;
  final Pet pet;
  final DateTime date;
  final String reason;
  bool isCompleted;

  Appointment({
    required this.id,
    required this.pet,
    required this.date,
    required this.reason,
    this.isCompleted = false,
  });

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }

  static List<Appointment> getSampleAppointments() {
    return [
      Appointment(
        id: '1',
        pet: Pet(name: "Karabaş", type: "Köpek", age: 3, imageUrl: "https://picsum.photos/200?random=1"),
        date: DateTime.now().add(Duration(days: 1)),
        reason: "Checkup",
      ),
      Appointment(
        id: '2',
        pet: Pet(name: "Pamuk", type: "Kedi", age: 2, imageUrl: "https://picsum.photos/200?random=2"),
        date: DateTime.now().add(Duration(days: 2)),
        reason: "Vaccination",
      ),
      Appointment(
        id: '3',
        pet: Pet(name: "Maviş", type: "Kuş", age: 1, imageUrl: "https://picsum.photos/200?random=3"),
        date: DateTime.now().add(Duration(days: 3)),
        reason: "Grooming",
      ),
    ];
  }
}