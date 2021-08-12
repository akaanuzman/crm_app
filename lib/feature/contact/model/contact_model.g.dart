// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) {
  return ContactModel(
    message: json['message'] as String?,
    userid: json['userid'] as String?,
    users: (json['users'] as List<dynamic>?)
        ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'users': instance.users,
    };

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
    screenName: json['screenName'] as String?,
    fullName: json['fullName'] as String?,
    company: json['company'] as String?,
    email: json['email'] as String?,
    photo: json['photo'] as String?,
    telephone: json['telephone'] as String?,
    detail: json['detail'] as String?,
    job: json['job'] as String?,
    birthday: json['birthday'] as String?,
  );
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'screenName': instance.screenName,
      'fullName': instance.fullName,
      'company': instance.company,
      'email': instance.email,
      'photo': instance.photo,
      'telephone': instance.telephone,
      'detail': instance.detail,
      'job': instance.job,
      'birthday': instance.birthday,
    };
