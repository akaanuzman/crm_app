// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetailModel _$ProjectDetailModelFromJson(Map<String, dynamic> json) {
  return ProjectDetailModel(
    id: json['id'] as String?,
    okgorev: json['okgorev'] as int?,
    allgorev: json['allgorev'] as int?,
    name: json['name'] as String?,
    userName: json['userName'] as String?,
    document: json['document'] as String?,
    detail: json['detail'] as String?,
    link: json['link'] as String?,
    access: json['access'] as String?,
    isActive: json['isActive'] as String?,
    users: (json['users'] as List<dynamic>?)
        ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProjectDetailModelToJson(ProjectDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'okgorev': instance.okgorev,
      'allgorev': instance.allgorev,
      'name': instance.name,
      'userName': instance.userName,
      'document': instance.document,
      'detail': instance.detail,
      'link': instance.link,
      'access': instance.access,
      'isActive': instance.isActive,
      'users': instance.users,
    };

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
    fullName: json['fullName'] as String?,
    photo: json['photo'] as String?,
  );
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'photo': instance.photo,
    };
