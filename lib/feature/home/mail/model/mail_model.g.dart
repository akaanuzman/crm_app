// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MailModel _$MailModelFromJson(Map<String, dynamic> json) {
  return MailModel(
    message: json['message'] as String?,
    userid: json['userid'] as String?,
    emails: (json['emails'] as List<dynamic>?)
        ?.map((e) => Emails.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MailModelToJson(MailModel instance) => <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'emails': instance.emails,
    };

Emails _$EmailsFromJson(Map<String, dynamic> json) {
  return Emails(
    user_id: json['user_id'] as String?,
    user_name: json['user_name'] as String?,
    user_email: json['user_email'] as String?,
    user_photo: json['user_photo'] as String?,
    my_id: json['my_id'] as String?,
    id: json['id'] as String?,
    read_it: json['read_it'] as String?,
    title: json['title'] as String?,
    content: json['content'] as String?,
    date: json['date'] as String?,
  );
}

Map<String, dynamic> _$EmailsToJson(Emails instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'user_email': instance.user_email,
      'user_photo': instance.user_photo,
      'my_id': instance.my_id,
      'id': instance.id,
      'read_it': instance.read_it,
      'title': instance.title,
      'content': instance.content,
      'date': instance.date,
    };
