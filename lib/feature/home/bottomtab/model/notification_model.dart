// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  String? message;
  String? userid;
  List<Emails>? emails;

  NotificationModel({this.message, this.userid, this.emails});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

@JsonSerializable()
class Emails {
  String? user_name;
  String? readIt;
  String? title;
  String? content;
  String? date;

  Emails({this.user_name, this.readIt, this.title, this.content, this.date});

  factory Emails.fromJson(Map<String, dynamic> json) => _$EmailsFromJson(json);

  Map<String, dynamic> toJson() => _$EmailsToJson(this);
}
