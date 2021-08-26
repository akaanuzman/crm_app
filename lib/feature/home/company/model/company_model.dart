// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  String? message;
  String? userid;
  List<Company>? company;

  CompanyModel({this.message, this.userid, this.company});

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}

@JsonSerializable()
class Company {
  String? id;
  String? name;
  String? c_name;
  String? is_active;
  String? email;
  String? telephone;
  String? web_site;
  String? address;
  String? detail;
  String? photo;
  String? tax_number;
  String? tax_department;
  String? location;

  Company(
      {this.id,
      this.name,
      this.c_name,
      this.is_active,
      this.email,
      this.telephone,
      this.web_site,
      this.address,
      this.detail,
      this.photo,
      this.tax_number,
      this.tax_department,
      this.location});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
