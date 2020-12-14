import 'dart:convert';

import 'package:deneme12/models/api_response.dart';
import 'package:deneme12/models/note.dart';
import 'package:deneme12/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': ''};
  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes, error: false);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occorud');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occorud'));
  }

  Future<APIResponse<Note>> getNote() {
    return http.get(API + '/notes/', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);

        final note = Note(
          noteID: jsonData['noteID'],
          noteTitle: jsonData['noteTitle'],
          noteContent: jsonData['noteContent'],
          createDateTime: DateTime.parse(jsonData['createDateTime']),
          lastEditDataTime: jsonData['lastEditDataTime'] != null
              ? DateTime.parse(jsonData['lastEditDataTime'])
              : null,
        );

        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: 'An error occorud');
    }).catchError((_) =>
        APIResponse<Note>(error: true, errorMessage: 'An error occorud'));
  }
}
