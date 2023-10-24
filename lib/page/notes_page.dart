import 'package:flutter/material.dart';
import 'package:hive_app_1/model/notes.dart';
import 'package:hive_app_1/widget/notes_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final Box box = Hive.box('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: box.isEmpty 
        ? Center(
          child: Text(
              'No Notes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
        )
        : ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(8),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: box.keys.length,
            itemBuilder: (context, index) {
              Notes note = box.getAt(index);

              return NotesWidget(
                title: note.title,
                description: note.description,
                onChanged: (_) {},
                editItems: () {},
                deleteItems: () {
                  box.deleteAt(index);
                },
              );
            }
          );
        }
      ),
    );
  }
}