// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  String? message;
  String? userid;
  List<Users>? users;
  List<Guides>? guides;

  ContactModel({this.message, this.userid, this.users, this.guides});

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}

@JsonSerializable()
class Users {
  String? screenName;
  // ignore: non_constant_identifier_names
  String? full_name;
  String? company;
  String? email;
  String? photo;
  String? telephone;
  String? detail;
  String? job;
  String? birthday;

  Users(
      {this.screenName,
      this.full_name,
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

@JsonSerializable()
class Guides {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? isActive;
  String? detail;
  String? company;
  String? companyId;
  String? job;
  String? birthday;
  String? added;
  String? updated;
  String? webSite;
  String? location;
  String? photo;
  String? userId;
  String? customer;
  String? worker;

  Guides(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.isActive,
      this.detail,
      this.company,
      this.companyId,
      this.job,
      this.birthday,
      this.added,
      this.updated,
      this.webSite,
      this.location,
      this.photo,
      this.userId,
      this.customer,
      this.worker});

  factory Guides.fromJson(Map<String, dynamic> json) => _$GuidesFromJson(json);

  Map<String, dynamic> toJson() => _$GuidesToJson(this);
}
