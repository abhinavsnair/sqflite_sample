
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite_sample/functions/db.dart';
import 'package:sqflite_sample/screen/add_screen.dart';
import 'package:sqflite_sample/screen/list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    getallstudents();
    return Scaffold(
      body: Column(
        children: [
          AddScreen(),
          const Expanded(child: ListScreen())
        ],
      ),
      

    );
  }
}
