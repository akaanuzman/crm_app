// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'company_detail_model.g.dart';

@JsonSerializable()
class CompanyDetailModel {
  String? message;
  String? userid;
  String? id;
  List<Worker>? worker;
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

  CompanyDetailModel(
      {this.message,
      this.userid,
      this.id,
      this.worker,
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

  factory CompanyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDetailModelToJson(this);
}

@JsonSerializable()
class Worker {
  String? full_name;
  String? email;
  String? photo;
  String? telephone;
  String? detail;
  String? job;
  String? company_id;
  String? birthday;

  Worker(
      {this.full_name,
      this.email,
      this.photo,
      this.telephone,
      this.detail,
      this.job,
      this.company_id,
      this.birthday});

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);
}
