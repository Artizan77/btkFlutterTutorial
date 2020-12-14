import 'package:deneme12/models/api_response.dart';
import 'package:deneme12/models/note_for_listing.dart';
import 'package:deneme12/services/notes_service.dart';
import 'package:deneme12/view/note_delete.dart';
import 'package:deneme12/view/note_modify.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.I<NotesService>();
  APIResponse<List<NoteForListing>> _apiResponse;
  bool _isLoading = false;

  String formatDataTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNotesList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NoteModify(),
            ),
          );
        },
      ),
      body: Builder(builder: (_) {
        if (_isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (_apiResponse.error) {
          return Center(
            child: Text(_apiResponse.errorMessage),
          );
        }
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: Colors.green,
          ),
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(_apiResponse.data[index].noteID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                  context: context,
                  builder: (_) => NoteDelete(),
                );
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              child: ListTile(
                title: Text(
                  _apiResponse.data[index].noteTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                  'Last edited on ${formatDataTime(_apiResponse.data[index].lastEditDataTime ?? _apiResponse.data[index].createDateTime)}',
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          NoteModify(noteID: _apiResponse.data[index].noteID),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: _apiResponse.data.length,
        );
      }),
    );
  }
}
