// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  String? message;
  String? userid;
  String? user_name;
  String? full_name;
  String? email;
  String? photo;
  String? is_active;
  String? telephone;
  String? detail;
  String? company_name;
  String? job;
  String? birthday;
  String? added;
  String? updated;
  String? web_site;
  String? location;
  String? instagram;
  String? linkedin;
  String? github;
  String? twitter;
  String? facebook;

  ProfileModel(
      {this.message,
      this.userid,
      this.user_name,
      this.full_name,
      this.email,
      this.photo,
      this.is_active,
      this.telephone,
      this.detail,
      this.company_name,
      this.job,
      this.birthday,
      this.added,
      this.updated,
      this.web_site,
      this.location,
      this.instagram,
      this.linkedin,
      this.github,
      this.twitter,
      this.facebook});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
