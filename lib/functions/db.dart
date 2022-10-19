import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../model/student_model.dart';

ValueNotifier<List<StudentModel>> studentlistnotifier = ValueNotifier([]);
late Database _db;
Future<void> initializedata() async {
   _db = await openDatabase('student.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE data (id INTEGER PRIMARY KEY, name TEXT, age TEXT)');
  });
}

Future<void> onAddstudent(StudentModel value) async {
  await _db.rawInsert(
      'INSERT INTO data (name,age) VALUES(?,?)', [value.name, value.age]);
      getallstudents();
  // studentlistnotifier.value.add(value);
  // studentlistnotifier.notifyListeners();
}

Future<void> getallstudents() async {
  final _values = await _db.rawQuery('SELECT * FROM data');
  print(_values);
  studentlistnotifier.value.clear();
  _values.forEach((map) {
    final student = StudentModel.fromMap(map);
    studentlistnotifier.value.add(student);
    studentlistnotifier.notifyListeners();
  });
}

Future<void>deletestudents(int id)async{
_db.rawDelete('DELETE FROM data WHERE id = ?',[id]);
getallstudents();
}
