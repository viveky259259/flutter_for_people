import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_for_people/bloc/notes/note.bloc.dart';
import 'package:flutter_for_people/bloc/notes/note.event.dart';
import 'package:flutter_for_people/bloc/notes/note.state.dart';

class NotesUi extends StatefulWidget {
  @override
  _NotesUiState createState() => _NotesUiState();
}

class _NotesUiState extends State<NotesUi> {
  @override
  Widget build(BuildContext context) {
    final NoteBloc noteBloc = BlocProvider.of<NoteBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              noteBloc.dispatch(OpenAddNoteUiEvent(context));
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        bloc: noteBloc,
        builder: (BuildContext context, NoteState state) {
          if (state is InitialNoteState) {
            return Center(
              child: Text('Welcome to notes app'),
            );
          } else if (state is FetchingNoteCompleteState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.notes[index].title),
                  subtitle: Text(state.notes[index].description),
                );
              },
            );
          }
          return Center(child: Text("Notes app home page"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteBloc.dispatch(GetNotesEvent());
        },
        child: Icon(Icons.slideshow),
      ),
    );
  }
}
