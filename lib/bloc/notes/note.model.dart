class NoteModel {
  String _title;
  String _description;

  NoteModel(this._title, this._description);

  String get description => _description;

  String get title => _title;
}
