
import 'package:flutter/material.dart';
import 'package:flutter_example/pages/pet/pet_details.dart';
import '../../model/pet.dart';

class PetPage extends StatelessWidget {
  PetPage({Key? key}) : super(key: key);
  final List<Pet> pet = Pet.getSamplePets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Page'),
      ),
      body: ListView.builder(
        itemCount: pet.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Row(
          children: [
            Expanded(
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(pet[index].imageUrl),
                  ),
                  title: Text('Pet ${pet[index].name}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'Type: Pet Type ${pet[index].type}, Age: ${pet[index].age} years'),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PetDetails(
                        pet: Pet(
                          name: pet[index].name,
                          type: pet[index].type,
                          age: pet[index].age,
                          imageUrl: pet[index].imageUrl,
                        ),
                    ),
                  ));
                },
                icon: Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
    );
  }
}
