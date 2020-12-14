class Note {
  String noteID;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  DateTime lastEditDataTime;

  Note(
      {this.noteID,
      this.noteContent,
      this.noteTitle,
      this.createDateTime,
      this.lastEditDataTime});

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      noteContent: item['noteContent'],
      createDateTime: DateTime.parse(item['createDateTime']),
      lastEditDataTime: item['lastEditDataTime'] != null
          ? DateTime.parse(item['lastEditDataTime'])
          : null,
    );
  }
}
