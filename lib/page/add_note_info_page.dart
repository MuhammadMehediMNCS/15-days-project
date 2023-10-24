import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app_1/model/notes.dart';

class AddNoteInfoPage extends StatefulWidget {
  const AddNoteInfoPage({super.key});

  @override
  State<AddNoteInfoPage> createState() => _AddNoteInfoPageState();
}

class _AddNoteInfoPageState extends State<AddNoteInfoPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  final Box box = Hive.box('notes');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Notes(
          title: title.text,
          description: description.text
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          //automaticallyImplyLeading: false,
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
                    validator: (title) {
                      if(title!.isEmpty) {
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
                      final form = _formKey.currentState!;
    
                      if(form.validate()) {
                        form.save();
                        box.add(
                          Notes(
                            title: title.text,
                            description: description.text
                          )
                        );
                      }
                      Navigator.pop(context);
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}