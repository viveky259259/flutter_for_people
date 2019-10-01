class NoteEvent {}

///list of events
/// 1.getNotes 2.add 3.remove 4.remove 5.viewDetailNote

class GetNotesEvent extends NoteEvent {}

class AddNoteEvent extends NoteEvent {}

class RemoveNoteEvent extends NoteEvent {}

class UpdateNoteEvent extends NoteEvent {}

class ViewDetailNoteEvent extends NoteEvent {}
