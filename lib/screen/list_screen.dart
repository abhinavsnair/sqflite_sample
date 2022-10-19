import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite_sample/functions/db.dart';
import 'package:sqflite_sample/model/student_model.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentlistnotifier,
        builder:
            (BuildContext context, List<StudentModel> student, Widget? child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final data = student[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: IconButton(
                  onPressed: () {
                    deletestudents(data.id!);
                  },
                 icon: const Icon( Icons.delete,
                  color: Colors.red,),
                ),
              );
            },
            separatorBuilder: ((context, index) {
              return const Divider();
            }),
            itemCount: student.length,
          );
        });
  }
}
