class BoardListObject {
   final String title;
   List<BoardItemObject>? items;
  BoardListObject({required this.title, this.items});
}

class BoardItemObject {
  final String title;
  final String from;

  BoardItemObject({this.title = "", this.from = ""});
}
