import 'package:json_annotation/json_annotation.dart';
part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  String? message;
  String? userid;
  List<Projects>? projects;

  ProjectModel({this.message, this.userid, this.projects});

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}

@JsonSerializable()
class Projects {
  String? id;
  int? okgorev;
  int? allgorev;
  String? name;
  String? userName;
  String? document;
  String? detail;
  String? link;
  String? access;
  String? isActive;
  List<Users>? users;

  Projects(
      {this.id,
      this.okgorev,
      this.allgorev,
      this.name,
      this.userName,
      this.document,
      this.detail,
      this.link,
      this.access,
      this.isActive,
      this.users});

  factory Projects.fromJson(Map<String, dynamic> json) => _$ProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsToJson(this);
}

@JsonSerializable()
class Users {
  String? fullName;
  String? photo;

  Users({this.fullName, this.photo});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
