import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_for_people/bloc/notes/note.bloc.dart';

import 'notes/note.add.ui.dart';
import 'notes/note.ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteBloc>(
            builder: (context) => NoteBloc(), child: NotesUi()),
        BlocProvider<NoteBloc>(
            builder: (context) => NoteBloc(), child: NotesAddUi()),
      ],
      child: MaterialApp(home: NotesUi()),
    );
  }
}
