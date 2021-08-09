import 'package:json_annotation/json_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  String? id;
  List<String>? gorev;
  String? name;
  String? usersId;
  String? document;
  String? detail;
  String? link;
  String? access;
  String? isActive;
  List<Users>? users;

  ProjectModel(
      {this.id,
      this.gorev,
      this.name,
      this.usersId,
      this.document,
      this.detail,
      this.link,
      this.access,
      this.isActive,
      this.users});

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}

@JsonSerializable()
class Users {
  String? fullName;
  String? photo;

  Users({this.fullName, this.photo});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
