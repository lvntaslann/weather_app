import 'package:flutter/material.dart';
import 'package:flutter_example/model/appointment.dart';
import 'package:flutter_example/model/pet.dart';

import 'appointment_details_page.dart';

class AppointmentPage extends StatefulWidget {
  AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final List<Appointment> appointments = Appointment.getSampleAppointments();
  TextEditingController petNameController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  TextEditingController petAgeController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Page'),
      ),
      body: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentDetailsPage(
                          appointment: appointments[index]),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  color: appointments[index].isCompleted
                      ? Colors.green.shade100
                      : Colors.white,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(appointments[index].pet.imageUrl),
                    ),
                    title: Text(
                      'Pet ${appointments[index].pet.name}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Date: ${appointments[index].date.toLocal().toString().split(' ')[0]}, Reason: ${appointments[index].reason}',
                    ),
                    trailing: IconButton(
                      icon: Icon(appointments[index].isCompleted
                          ? Icons.check_circle
                          : Icons.circle_outlined),
                      onPressed: () {
                        print(appointments[index].isCompleted);
                        setState(() {
                          appointments[index].toggleCompleted();
                        });
                        print(appointments[index].isCompleted);
                      },
                    ),
                  ),
                ),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: AlertDialog(
                    title: const Text('Add New Appointment'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: petNameController,
                          decoration:
                              const InputDecoration(labelText: 'Pet Name'),
                        ),
                        TextField(
                          controller: petTypeController,
                          decoration:
                              const InputDecoration(labelText: 'Pet Type'),
                        ),
                        TextField(
                          controller: petAgeController,
                          decoration:
                              const InputDecoration(labelText: 'Pet Age'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: reasonController,
                          decoration:
                              const InputDecoration(labelText: 'Reason'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              appointments.add(Appointment(
                                id: DateTime.now().toString(),
                                pet: Pet(
                                    name: petNameController.text,
                                    type: petTypeController.text,
                                    age: int.parse(petAgeController.text),
                                    imageUrl:
                                        'https://picsum.photos/200?random=${appointments.length + 1}'),
                                date: selectedDate,
                                reason: reasonController.text,
                              ));
                            });
                            petNameController.clear();
                            petTypeController.clear();
                            petAgeController.clear();
                            reasonController.clear();
                            Navigator.pop(context);
                          },
                          child: const Text('Add Appointment'),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
