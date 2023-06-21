import 'package:flutter/material.dart';
import '../pages/add_notes_page.dart';
import '../pages/next_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];

  void addNoteToList(String note) {
    setState(() {
      notes.add(note);
    });
  }

  void deleteNoteFromList(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void note(int index) {
    if (notes.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NextPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Notes Apps"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => note(index),
            title: Text(notes[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteNoteFromList(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToNoteScreen(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToNoteScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNotes()),
    );

    if (result != null) {
      addNoteToList(result);
    }
  }
}
