// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return NotificationModel(
    message: json['message'] as String?,
    userid: json['userid'] as String?,
    emails: (json['emails'] as List<dynamic>?)
        ?.map((e) => Emails.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'emails': instance.emails,
    };

Emails _$EmailsFromJson(Map<String, dynamic> json) {
  return Emails(
    user_name: json['user_name'] as String?,
    readIt: json['readIt'] as String?,
    title: json['title'] as String?,
    content: json['content'] as String?,
    date: json['date'] as String?,
  );
}

Map<String, dynamic> _$EmailsToJson(Emails instance) => <String, dynamic>{
      'user_name': instance.user_name,
      'readIt': instance.readIt,
      'title': instance.title,
      'content': instance.content,
      'date': instance.date,
    };
