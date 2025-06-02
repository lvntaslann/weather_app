import 'package:flutter/material.dart';

import '../../model/pet.dart';

class PetDetails extends StatelessWidget {
  final Pet? pet;
const PetDetails({ Key? key, this.pet }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Details'),
      ),
      body: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage( pet?.imageUrl?? 'https://picsum.photos/200'),
          ),
          title: Text(
            'Pet ${pet?.name ?? "Unknown"}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Type: Pet Type ${pet?.type ?? "Unknown"}, Age: ${pet?.age ?? 0} years',
          ),
        ),
      )
    );
  }
}