import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Anket')),
        body: SurveyList(),
      ),
    );
  }
}

class SurveyList extends StatefulWidget {
  const SurveyList({Key? key}) : super(key: key);

  @override
  SurveyListState createState() => SurveyListState();
}

class SurveyListState extends State<SurveyList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("dilanketi").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No surveys found.'));
        } else {
          return buildBody(context, snapshot.data!.docs);
        }
      },
    );
  }

 Widget buildBody(BuildContext context, List<QueryDocumentSnapshot> snapshot) {
  return ListView(
    padding: EdgeInsets.only(top: 20),
    children: snapshot.map((data) => buildListItem(context, data)).toList(),
  );
}

Widget buildListItem(BuildContext context, QueryDocumentSnapshot data) {
  final row = Anket.fromMap(data.data() as Map<String, dynamic>, reference: data.reference);
  return Padding(
    key: ValueKey(row.isim),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(row.isim),
        trailing: Text(row.oy.toString()),
        onTap: () => row.reference.update({'oy':row.oy+1}),
        /*
        FirebaseFirestore.instance.runTransaction((transaction) async{
          final freshSnapshot=await transaction.get(row.reference);//gelen veri
          final fresh= Anket.fromSnapshot(freshSnapshot);//ankete çevirme
          await transaction.update(row.reference, {'oy':fresh.oy+1});
        },),

       İki farklı cihazdan tıklama işleminde arttırma da problem olmaması için bu işlem yapılabilir işletim sistemlerindeki mutex gibi 
        */
      ),
    ),
  );
}
}

final fakeSnapShot = [
  {"isim": "C#", "oy": 3},
  {"isim": "Java", "oy": 5},
  {"isim": "C", "oy": 7},
  {"isim": "Python", "oy": 22},
  {"isim": "Kotlin", "oy": 33},
  {"isim": "Swift", "oy": 45},
];

class Anket {
  late String isim;
  late int oy;
  late DocumentReference reference;

  Anket({required this.isim, required this.oy, required this.reference});

  Anket.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map["isim"] != null),
        assert(map["oy"] != null),
        isim = map["isim"],
        oy = map["oy"];

  Anket.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);
}




