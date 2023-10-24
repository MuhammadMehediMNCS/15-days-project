import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback editItems;
  final VoidCallback deleteItems;
  final ValueChanged<bool?>? onChanged;
  final bool isDone;

  const NotesWidget({
    super.key,
    required this.title,
    required this.description,
    required this.editItems,
    required this.deleteItems,
    required this.onChanged,
    this.isDone = false
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          icon: Icons.edit,
          color: Colors.green,
          caption: 'Edit',
          onTap: editItems,
        )
      ],
      secondaryActions: [
        IconSlideAction(
          icon: Icons.delete,
          color: Colors.red,
          caption: 'Delete',
          onTap: deleteItems,
        )
      ],
      child: buildNotesWidget(context),
    ),
  );
  
  Widget buildNotesWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: isDone,
            onChanged: onChanged
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor
                  ),
                ),
                if(description.isNotEmpty)
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.5,
                    color: Theme.of(context).primaryColor.withOpacity(.5)
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}