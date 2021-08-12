import 'package:json_annotation/json_annotation.dart';
part 'project_detail_model.g.dart';

@JsonSerializable()
class ProjectDetailModel {
  String? id;
  List<Gorev>? gorev;
  String? name;
  String? usersId;
  String? document;
  String? detail;
  String? link;
  String? access;
  String? isActive;
  List<Users>? users;
  List<Doc>? doc;

  ProjectDetailModel(
      {this.id,
      this.gorev,
      this.name,
      this.usersId,
      this.document,
      this.detail,
      this.link,
      this.access,
      this.isActive,
      this.users,
      this.doc});

  factory ProjectDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailModelToJson(this);
}

@JsonSerializable()
class Gorev {
  String? id;
  String? sirala;
  String? access;
  String? projectId;
  String? name;
  String? sDate;
  String? fDate;
  String? detail;
  String? isActive;
  String? document;
  String? kanbanId;
  String? deleteT;
  String? ddTask;

  Gorev(
      {this.id,
      this.sirala,
      this.access,
      this.projectId,
      this.name,
      this.sDate,
      this.fDate,
      this.detail,
      this.isActive,
      this.document,
      this.kanbanId,
      this.deleteT,
      this.ddTask});

  factory Gorev.fromJson(Map<String, dynamic> json) => _$GorevFromJson(json);

  Map<String, dynamic> toJson() => _$GorevToJson(this);
}

@JsonSerializable()
class Users {
  String? fullName;
  String? email;
  String? photo;
  String? telephone;
  String? detail;
  String? job;
  String? companyId;
  String? birthday;

  Users(
      {this.fullName,
      this.email,
      this.photo,
      this.telephone,
      this.detail,
      this.job,
      this.companyId,
      this.birthday});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}

@JsonSerializable()
class Doc {
  String? id;
  String? isActive;
  String? projectAccess;
  String? userId;
  String? date;
  String? location;
  String? name;
  String? uzanti;
  String? boyut;

  Doc(
      {this.id,
      this.isActive,
      this.projectAccess,
      this.userId,
      this.date,
      this.location,
      this.name,
      this.uzanti,
      this.boyut});

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);

  Map<String, dynamic> toJson() => _$DocToJson(this);
}
