import 'package:json_annotation/json_annotation.dart';
part 'company_detail_model.g.dart';

@JsonSerializable()
class CompanyDetailModel {
  String? message;
  String? userid;
  String? id;
  List<Worker>? worker;
  String? name;
  String? cName;
  String? isActive;
  String? email;
  String? telephone;
  String? webSite;
  String? address;
  String? detail;
  String? photo;
  String? taxNumber;
  String? taxDepartment;
  String? location;

  CompanyDetailModel(
      {this.message,
      this.userid,
      this.id,
      this.worker,
      this.name,
      this.cName,
      this.isActive,
      this.email,
      this.telephone,
      this.webSite,
      this.address,
      this.detail,
      this.photo,
      this.taxNumber,
      this.taxDepartment,
      this.location});

  factory CompanyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDetailModelToJson(this);
}

@JsonSerializable()
class Worker {
  String? fullName;
  String? email;
  String? photo;
  String? telephone;
  String? detail;
  String? job;
  String? companyId;
  String? birthday;

  Worker(
      {this.fullName,
      this.email,
      this.photo,
      this.telephone,
      this.detail,
      this.job,
      this.companyId,
      this.birthday});

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);
}
