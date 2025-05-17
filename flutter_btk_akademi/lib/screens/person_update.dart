import 'package:flutter/material.dart';
import 'package:list_view_builder/model/new_person_validator.dart';
import '../model/personInformations.dart';

class PersonEdit extends StatefulWidget {
  final PersonInformations selectedPerson;

  PersonEdit(this.selectedPerson);

  @override
  _PersonEditState createState() => _PersonEditState();
}

class _PersonEditState extends State<PersonEdit> with ValidatorMixin {
  late PersonInformations selectedPerson;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedPerson = widget.selectedPerson;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Güncelle"),
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
      initialValue: selectedPerson.name,
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Levent"),
      validator: validatorName,
      onSaved: (String? value) {
        if (value != null) selectedPerson.name = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedPerson.surname,
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Aslan"),
      validator: validatorName,
      onSaved: (String? value) {
        if (value != null) selectedPerson.surname = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedPerson.examNote.toString(),
      decoration: InputDecoration(labelText: "Not", hintText: "65"),
      validator: validatorNote,
      onSaved: (String? value) {
        if (value != null) selectedPerson.examNote = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return FloatingActionButton(
      onPressed: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Navigator.pop(context, selectedPerson);
        }
      },
      child: Text(
        "Güncelle",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
