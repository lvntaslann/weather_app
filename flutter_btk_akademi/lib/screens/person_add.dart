import 'package:flutter/material.dart';
import 'package:list_view_builder/model/new_person_validator.dart';
import '../model/personInformations.dart';

class PersonAdd extends StatefulWidget {
  final List<PersonInformations> personInformation;

  PersonAdd(this.personInformation);

  @override
  _PersonAddState createState() => _PersonAddState();
}

class _PersonAddState extends State<PersonAdd> with ValidatorMixin {
  late PersonInformations personInformations = PersonInformations.withOutInfo();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildNameField(),
              buildLastNameField(),
              buildGradeField(),
              SizedBox(height: 100),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Levent"),
      validator: validatorName,
      onSaved: (String? value) {
        if (value != null) personInformations.name = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Aslan"),
      validator: validatorName,
      onSaved: (String? value) {
        if (value != null) personInformations.surname = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Not", hintText: "65"),
      validator: validatorNote,
      onSaved: (String? value) {
        if (value != null) personInformations.examNote = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return FloatingActionButton(
      onPressed: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Navigator.pop(context, personInformations);
        }
      },
      child: Text(
        "Kaydet",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
