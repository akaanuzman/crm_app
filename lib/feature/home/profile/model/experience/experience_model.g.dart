// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) {
  return ExperienceModel(
    message: json['message'] as String?,
    userid: json['userid'] as String?,
    timeline: (json['timeline'] as List<dynamic>?)
        ?.map((e) => Timeline.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ExperienceModelToJson(ExperienceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'timeline': instance.timeline,
    };

Timeline _$TimelineFromJson(Map<String, dynamic> json) {
  return Timeline(
    id: json['id'] as String?,
    date: json['date'] as String?,
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
    detail: json['detail'] as String?,
  );
}

Map<String, dynamic> _$TimelineToJson(Timeline instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'detail': instance.detail,
    };
