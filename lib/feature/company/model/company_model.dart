// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  String? message;
  String? userid;
  List<Companys>? companys;

  CompanyModel({this.message, this.userid, this.companys});

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}

@JsonSerializable()
class Companys {
  String? id;
  String? name;
  String? email;
  String? telephone;
  String? location;
  String? web_site;
  String? photo;

  Companys(
      {this.name,
      this.email,
      this.telephone,
      this.location,
      this.web_site,
      this.photo});

  factory Companys.fromJson(Map<String, dynamic> json) {
    return _$CompanysFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanysToJson(this);
}