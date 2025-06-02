import 'package:flutter/material.dart';
import 'package:flutter_example/model/appointment.dart';

class AppointmentDetailsPage extends StatelessWidget {
  final Appointment appointment;
const AppointmentDetailsPage({ Key? key, required this.appointment }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details for ${appointment.pet.name}'),
      ),
      body: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Image.network(
              appointment.pet.imageUrl,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            Text(appointment.pet.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              'Type: ${appointment.pet.type}, Age: ${appointment.pet.age} years',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Appointment Date: ${appointment.date.toLocal().toString().split(' ')[0]}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}