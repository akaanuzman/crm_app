import 'package:json_annotation/json_annotation.dart';

part 'experience_model.g.dart';

@JsonSerializable()
class ExperienceModel {
  String? message;
  String? userid;
  List<Timeline>? timeline;

  ExperienceModel({this.message, this.userid, this.timeline});

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => _$ExperienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceModelToJson(this);
}

@JsonSerializable()
class Timeline {
  String? id;
  String? date;
  String? title;
  String? subtitle;
  String? detail;

  Timeline({this.id, this.date, this.title, this.subtitle, this.detail});

  factory Timeline.fromJson(Map<String, dynamic> json) => _$TimelineFromJson(json);

  Map<String, dynamic> toJson() => _$TimelineToJson(this);
}
