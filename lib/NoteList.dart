import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_note_keeper/NoteDetail.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("fab tapped");
          navigateToDetail(context,"Add Note");
        },
        tooltip: "Add Note",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int positon) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Icon(Icons.keyboard_arrow_right),
                  ),
                  title: Text("dummy tile", style: titleStyle),
                  subtitle: Text("Dummy date"),
                  trailing: Icon(Icons.delete, color: Colors.grey),
                  onTap: () {
                    navigateToDetail(context,"Edit note");
                  }));
        });
  }

  void navigateToDetail(BuildContext context,title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(title);
    }));
  }
}
