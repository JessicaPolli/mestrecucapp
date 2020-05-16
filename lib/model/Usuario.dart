

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final notesReference = FirebaseDatabase.instance.reference().child('usuario');

class _ListViewNoteState extends State<ListViewNote> {
  List<Usuario> items;
  StreamSubscription<Event> _onNoteAddedSubscription;

  @override
  void initState() {
    super.initState();
    items = new List();
    _onNoteAddedSubscription = notesReference.onChildAdded.listen(_onNoteAdded);
  }

  @override
  void dispose() {
    _onNoteAddedSubscription.cancel();
    super.dispose();
  }

  void _onNoteAdded(Event event) {
    setState(() {
      items.add(new Note.fromSnapshot(event.snapshot));
    });
  }
}



class Usuario {

}