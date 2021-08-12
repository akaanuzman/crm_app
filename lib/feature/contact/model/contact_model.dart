import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  String? message;
  String? userid;
  List<Users>? users;

  ContactModel({this.message, this.userid, this.users});

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}

@JsonSerializable()
class Users {
  String? screenName;
  String? fullName;
  String? company;
  String? email;
  String? photo;
  String? telephone;
  String? detail;
  String? job;
  String? birthday;

  Users(
      {this.screenName,
      this.fullName,
      this.company,
      this.email,
      this.photo,
      this.telephone,
      this.detail,
      this.job,
      this.birthday});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
