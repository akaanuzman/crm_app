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
  String? name;
  String? email;
  String? telephone;
  String? location;
  String? webSite;
  String? photo;

  Company(
      {this.name,
      this.email,
      this.telephone,
      this.location,
      this.webSite,
      this.photo});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
