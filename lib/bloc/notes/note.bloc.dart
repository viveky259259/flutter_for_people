import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_people/bloc/notes/note.event.dart';
import 'package:flutter_for_people/bloc/notes/note.model.dart';
import 'package:flutter_for_people/bloc/notes/note.state.dart';
import 'package:flutter_for_people/bloc/notes/note.storage.dart';

import 'note.add.ui.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  @override
  NoteState get initialState => InitialNoteState();

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    if (event is GetNotesEvent) {
      List<NoteModel> notes = noteStorage.notes;
      yield FetchingNoteCompleteState(notes);
    } else if (event is OpenAddNoteUiEvent) {
      Navigator.push(
          event.context, MaterialPageRoute(builder: (context) => NotesAddUi()));
    } else if (event is AddNoteEvent) {
      yield AddingNoteInProgressState();
      noteStorage.notes.add(event.noteModel);
      yield AddingNoteCompleteState();
      List<NoteModel> notes = noteStorage.notes;
      yield FetchingNoteCompleteState(notes);
    }
  }
}
