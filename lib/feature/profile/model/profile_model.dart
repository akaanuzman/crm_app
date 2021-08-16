// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';


@JsonSerializable()
class ProfileModel {
  String? message;
  String? userid;
  String? full_name;
  String? email;
  String? photo;
  String? telephone;
  String? detail;
  String? job;
  String? companyId;
  String? birthday;

  ProfileModel(
      {this.message,
      this.userid,
      this.full_name,
      this.email,
      this.photo,
      this.telephone,
      this.detail,
      this.job,
      this.companyId,
      this.birthday});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
