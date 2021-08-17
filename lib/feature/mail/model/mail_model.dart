// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'mail_model.g.dart';

@JsonSerializable()
class MailModel {
  String? message;
  String? userid;
  List<Emails>? emails;

  MailModel({this.message, this.userid, this.emails});

  factory MailModel.fromJson(Map<String, dynamic> json) =>
      _$MailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MailModelToJson(this);
}

@JsonSerializable()
class Emails {
  String? its_id;
  String? user_name;
  String? user_email;
  String? user_photo;
  String? id;
  String? read_it;
  String? title;
  String? content;
  String? date;

  Emails(
      {this.its_id,
      this.user_name,
      this.user_email,
      this.user_photo,
      this.id,
      this.read_it,
      this.title,
      this.content,
      this.date});

  factory Emails.fromJson(Map<String, dynamic> json) => _$EmailsFromJson(json);

  Map<String, dynamic> toJson() => _$EmailsToJson(this);
}
