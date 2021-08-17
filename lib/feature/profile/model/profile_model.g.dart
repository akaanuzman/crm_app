// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    message: json['message'] as String?,
    userid: json['userid'] as String?,
    user_name: json['user_name'] as String?,
    full_name: json['full_name'] as String?,
    email: json['email'] as String?,
    photo: json['photo'] as String?,
    is_active: json['is_active'] as String?,
    telephone: json['telephone'] as String?,
    detail: json['detail'] as String?,
    company_name: json['company_name'] as String?,
    job: json['job'] as String?,
    birthday: json['birthday'] as String?,
    added: json['added'] as String?,
    updated: json['updated'] as String?,
    web_site: json['web_site'] as String?,
    location: json['location'] as String?,
    instagram: json['instagram'] as String?,
    linkedin: json['linkedin'] as String?,
    github: json['github'] as String?,
    twitter: json['twitter'] as String?,
    facebook: json['facebook'] as String?,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'user_name': instance.user_name,
      'full_name': instance.full_name,
      'email': instance.email,
      'photo': instance.photo,
      'is_active': instance.is_active,
      'telephone': instance.telephone,
      'detail': instance.detail,
      'company_name': instance.company_name,
      'job': instance.job,
      'birthday': instance.birthday,
      'added': instance.added,
      'updated': instance.updated,
      'web_site': instance.web_site,
      'location': instance.location,
      'instagram': instance.instagram,
      'linkedin': instance.linkedin,
      'github': instance.github,
      'twitter': instance.twitter,
      'facebook': instance.facebook,
    };
