// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return ProjectModel(
    id: json['id'] as String?,
    gorev: (json['gorev'] as List<dynamic>?)?.map((e) => e as String).toList(),
    name: json['name'] as String?,
    usersId: json['usersId'] as String?,
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

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gorev': instance.gorev,
      'name': instance.name,
      'usersId': instance.usersId,
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
