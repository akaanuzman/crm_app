// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    message: json['message'] as String?,
    userid: json['userid'] as String?,
    full_name: json['full_name'] as String?,
    email: json['email'] as String?,
    photo: json['photo'] as String?,
    telephone: json['telephone'] as String?,
    detail: json['detail'] as String?,
    job: json['job'] as String?,
    companyId: json['companyId'] as String?,
    birthday: json['birthday'] as String?,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'full_name': instance.full_name,
      'email': instance.email,
      'photo': instance.photo,
      'telephone': instance.telephone,
      'detail': instance.detail,
      'job': instance.job,
      'companyId': instance.companyId,
      'birthday': instance.birthday,
    };
