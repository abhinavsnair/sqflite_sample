// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:sqflite_sample/functions/db.dart';
import 'package:sqflite_sample/model/student_model.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _namecontroller,
              decoration: InputDecoration(
                  hintText: 'Name', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _agecontroller,
              decoration: InputDecoration(
                  hintText: 'Age', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  onButtonClicked();
                },
                icon: Icon(Icons.add),
                label: Text('Add'))
          ],
        ),
      ),
    );
  }

  Future<void> onButtonClicked() async {
    final _name = _namecontroller.text.trim();
    final _age = _agecontroller.text.trim();

    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    onAddstudent(StudentModel(name: _name, age: _age));
  }
}
