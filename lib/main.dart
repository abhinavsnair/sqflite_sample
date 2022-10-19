import 'package:flutter/material.dart';
import 'package:sqflite_sample/functions/db.dart';
import 'package:sqflite_sample/screen/home_screen.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializedata();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
