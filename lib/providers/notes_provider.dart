import 'package:flutter/material.dart';
import '../model/note_model.dart';

class NoteProvider with ChangeNotifier {
  List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  void addNote(NoteModel note) {
    _notes.add(note);
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }

  void updateNote(int index, NoteModel newNote) {
    _notes[index] = newNote;
    notifyListeners();
  }
}
