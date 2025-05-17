import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_view_builder/screens/person_update.dart';
import '../model/personInformations.dart';
import 'person_add.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<PersonInformations> personInformation = [
    PersonInformations.withId(1, "Levent", "Aslan", 31,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2pC6k_GmKNjP79aEpJcZ-UgZRrFlskRrzNA&s"),
    PersonInformations.withId(2, "Mehmet", "Cem", 45,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2pC6k_GmKNjP79aEpJcZ-UgZRrFlskRrzNA&s"),
    PersonInformations.withId(3, "Aslan", "Levent", 67,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2pC6k_GmKNjP79aEpJcZ-UgZRrFlskRrzNA&s"),
    PersonInformations.withId(4, "Küçük", "Hakan", 57,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2pC6k_GmKNjP79aEpJcZ-UgZRrFlskRrzNA&s"),
  ];
  String sonuc = "";
  PersonInformations selectedPerson =
      PersonInformations.withId(0, "", "", 0, "");

  void add() async {
    final newPerson = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonAdd(personInformation),
      ),
    );

    if (newPerson != null && newPerson is PersonInformations) {
      setState(() {
        personInformation.add(newPerson);
      });
    }
  }

  void delete() {
    setState(() {
      personInformation.remove(selectedPerson);
    });
    var deletedMessage = "Ogrenci silindi: ${selectedPerson.name}";
    dialogGonder(context, sonuc, deletedMessage);
  }

  void update() async {
    final updatedPerson = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonEdit(selectedPerson)),
    );

    if (updatedPerson != null && updatedPerson is PersonInformations) {
      setState(() {
        int index = personInformation
            .indexWhere((person) => person.id == updatedPerson.id);
        if (index != -1) {
          personInformation[index] = updatedPerson;
        }
      });
    }
  }

  String notHesapla() {
    String sonuc = "";
    for (int i = 0; i < personInformation.length; i++) {
      var not = personInformation[i].examNote;
      if (not <= 49) {
        sonuc += "ogrenci ${i} kaldı ${personInformation[i].examNote}\n";
      } else {
        sonuc += "ogrenci ${i} geçti ${personInformation[i].examNote}\n";
      }
    }
    return sonuc;
  }

  void dialogGonder(
    BuildContext context,
    String sonuc,
    String message,
  ) {
    var alert = AlertDialog(
      content: Text(sonuc),
      title: Text(message),
    );

    showDialog(context: context, builder: (context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ögrenci Takip sistemi"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: personInformation.length,
              itemBuilder: (context, index) {
                var person = personInformation[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(20.0),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(person.image),
                    ),
                    title: Text(person.name +
                        " " +
                        person.surname +
                        " " +
                        "[" +
                        person.getStatus +
                        "]"),
                    subtitle: Text(person.examNote.toString()),
                    trailing: buildStatusIcon(person.examNote.toString()),
                    onTap: () {
                      setState(() {
                        selectedPerson = person;
                      });
                      var alert = AlertDialog(
                        title: Text("Ögrenci"),
                        content: Text(person.name + " " + person.surname),
                      );
                      showDialog(context: context, builder: (context) => alert);
                    },
                  ),
                );
              },
            ),
          ),
          Text("Seçili öğrenci : ${selectedPerson.name}"),
          Row(
            children: [
              buttons(add, Icons.fiber_new_sharp, "New", Colors.greenAccent),
              buttons(update, Icons.update, "Update", Colors.amberAccent),
              buttons(delete, Icons.delete, "Delete", Colors.redAccent),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 100))
            ],
          ),
        ],
      ),
    );
  }

  Widget buttons(
      VoidCallback function, IconData icon, String text, Color color) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: ElevatedButton(
        onPressed: function,
        child: Row(
          children: [
            Icon(icon, size: 18),
            SizedBox(width: 4),
            Expanded(child: Text(text, overflow: TextOverflow.ellipsis)),
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
      ),
    );
  }

  Widget buildStatusIcon(String string) {
    var not = int.parse(string);
    if (not <= 49) {
      return Icon(
        Icons.clear,
        color: Colors.red,
      );
    } else {
      return Icon(
        Icons.done,
        color: Colors.green,
      );
    }
  }
}
