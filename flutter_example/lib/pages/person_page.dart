import 'package:flutter/material.dart';

import '../model/person.dart';

class PersonPage extends StatelessWidget {
const PersonPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Person person = Person(name: "Levent Aslan",age:22,jobTitle: "Software Engineer",email:"lvnt.aslann@gmail.com",phoneNumber: "5537743726");
    return Scaffold(
      appBar: AppBar(title: Text("Kişi kartı"),),
      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Ad: ${person.name}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Yaş: ${person.age}"),
                Text("Meslek:${person.jobTitle}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Text("E-posta: ${person.email}"),
                     const SizedBox(width: 20),
                      Text("Telefon: ${person.phoneNumber}"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}