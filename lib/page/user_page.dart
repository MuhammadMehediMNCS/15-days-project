import 'package:flutter/material.dart';
import 'package:hive_app_1/page/add_user_info_page.dart';
import 'package:hive_app_1/page/home_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
          }
        ),
        title: const Text('Edit Your Story'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: const Icon(Icons.add, size: 32),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUserInfoPage()));
        }
      ),
    );
  }
}