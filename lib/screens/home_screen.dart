import 'package:flutter/material.dart';
import 'package:notes_keeper_app_flutter/providers/notes_provider.dart';
import 'package:provider/provider.dart';
import '../model/note_model.dart';
import 'add_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("NotesKeeper", style: TextStyle(color: Colors.white)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddNoteScreen()),
          );
          if (result != null && result is Map) {
            noteProvider.addNote(result['note']);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: noteProvider.notes.isEmpty
          ? const Center(child: Text("No notes yet"))
          : ListView.builder(
        itemCount: noteProvider.notes.length,
        itemBuilder: (context, index) {
          final note = noteProvider.notes[index];
          return Card(
            child: ListTile(
              title: Text(note.title),
              subtitle: Text(note.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.green),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddNoteScreen(
                            note: note,
                            index: index,
                          ),
                        ),
                      );

                      if (result != null && result is Map) {
                        final updatedNote = result['note'] as NoteModel;
                        final noteIndex = result['index'] as int;
                        noteProvider.updateNote(noteIndex, updatedNote);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      noteProvider.deleteNote(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
