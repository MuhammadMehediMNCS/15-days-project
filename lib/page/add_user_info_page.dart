import 'package:flutter/material.dart';

class AddUserInfoPage extends StatefulWidget {
  const AddUserInfoPage({super.key});

  @override
  State<AddUserInfoPage> createState() => _AddUserInfoPageState();
}

class _AddUserInfoPageState extends State<AddUserInfoPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController district = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add Your Story'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: district,
                decoration: const InputDecoration(
                  labelText: 'District',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 64),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(220, 60),
                  shape: const StadiumBorder()
                ),
                child: const Text('Save Story'),
                onPressed: () {
                  Navigator.pop(context);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}