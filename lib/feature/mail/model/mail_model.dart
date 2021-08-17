import 'package:json_annotation/json_annotation.dart';
part 'mail_model.g.dart';

@JsonSerializable()
class MailModel {
  String? message;
  String? userid;
  List<Emails>? emails;

  MailModel({this.message, this.userid, this.emails});

  factory MailModel.fromJson(Map<String, dynamic> json) => _$MailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MailModelToJson(this);
}

@JsonSerializable()
class Emails {
  String? id;
  String? readIt;
  String? title;
  String? content;
  String? date;

  Emails({this.id, this.readIt, this.title, this.content, this.date});

  factory Emails.fromJson(Map<String, dynamic> json) => _$EmailsFromJson(json);

  Map<String, dynamic> toJson() => _$EmailsToJson(this);
}
