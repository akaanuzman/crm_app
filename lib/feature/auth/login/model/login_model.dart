import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String? token;
  String? status;

  LoginModel({this.token, this.status});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}