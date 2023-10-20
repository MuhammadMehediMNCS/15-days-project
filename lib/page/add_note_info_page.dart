import 'package:flutter/material.dart';

class AddNoteInfoPage extends StatefulWidget {
  const AddNoteInfoPage({super.key});

  @override
  State<AddNoteInfoPage> createState() => _AddNoteInfoPageState();
}

class _AddNoteInfoPageState extends State<AddNoteInfoPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "The field can't be empty.";
                    }
                  },
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: description,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(220, 60),
                    shape: const StadiumBorder()
                  ),
                  child: const Text('Save'),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}