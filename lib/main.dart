import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app_1/model/notes.dart';
import 'package:hive_app_1/page/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NotesAdapter());
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox('notes');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: const HomePage(),
    );
  }
}
