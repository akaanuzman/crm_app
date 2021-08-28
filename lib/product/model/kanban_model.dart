// ignore_for_file: unnecessary_this

class BoardItemObject{

  String? title;

  BoardItemObject({this.title}){
    if(this.title == null){
      this.title = "";
    }
  }

}

class BoardListObject{

  String? title;
  List<BoardItemObject>? items;

  BoardListObject({this.title,this.items}){
    if(this.title == null){
      this.title = "";
    }
    if(this.items == null){
      this.items = [];
    }
  }
}