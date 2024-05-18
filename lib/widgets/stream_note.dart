import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:todo_app/data/fire_store.dart';
import 'package:todo_app/model/notes_model.dart';
import 'package:todo_app/widgets/task_widgets.dart';

class Stream_note extends StatelessWidget {
  bool done;
  Stream_note(this.done, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FireStore_Datasource().stream(done),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var noteslist = FireStore_Datasource().getNotes(snapshot);
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var note = noteslist[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) async {
                  FireStore_Datasource().delet_note(note.id);
                   noteslist = await FireStore_Datasource().getNotes(snapshot);
                  note = noteslist[index];
                  Logger().wtf(noteslist.length);
                },
                child: Task_Widget(note),
              );
            },
            itemCount: noteslist.length,
          );
        });
  }
}
