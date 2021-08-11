import 'package:json_annotation/json_annotation.dart';

part 'project_detail_model.g.dart';

@JsonSerializable()
class ProjectDetailModel {
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

  ProjectDetailModel(
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

  factory ProjectDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailModelToJson(this);
}

@JsonSerializable()
class Users {
  String? fullName;
  String? photo;

  Users({this.fullName, this.photo});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
