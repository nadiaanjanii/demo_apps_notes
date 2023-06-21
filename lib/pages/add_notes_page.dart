import 'package:flutter/material.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Add New Notes"),
      // ),
      body: Notes(),
    );
  }
}

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Notes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(hintText: "Add Your Notes"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String note = _textEditingController.text;
                Navigator.pop(context, note);
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
