// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetailModel _$ProjectDetailModelFromJson(Map<String, dynamic> json) {
  return ProjectDetailModel(
    id: json['id'] as String?,
    gorev: (json['gorev'] as List<dynamic>?)
        ?.map((e) => Gorev.fromJson(e as Map<String, dynamic>))
        .toList(),
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
    doc: (json['doc'] as List<dynamic>?)
        ?.map((e) => Doc.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProjectDetailModelToJson(ProjectDetailModel instance) =>
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
      'doc': instance.doc,
    };

Gorev _$GorevFromJson(Map<String, dynamic> json) {
  return Gorev(
    id: json['id'] as String?,
    sirala: json['sirala'] as String?,
    access: json['access'] as String?,
    projectId: json['projectId'] as String?,
    name: json['name'] as String?,
    sDate: json['s_date'] as String?,
    fDate: json['f_date'] as String?,
    detail: json['detail'] as String?,
    isActive: json['isActive'] as String?,
    document: json['document'] as String?,
    kanbanId: json['kanbanId'] as String?,
    deleteT: json['deleteT'] as String?,
    ddTask: json['ddTask'] as String?,
  );
}

Map<String, dynamic> _$GorevToJson(Gorev instance) => <String, dynamic>{
      'id': instance.id,
      'sirala': instance.sirala,
      'access': instance.access,
      'projectId': instance.projectId,
      'name': instance.name,
      'sDate': instance.sDate,
      'fDate': instance.fDate,
      'detail': instance.detail,
      'isActive': instance.isActive,
      'document': instance.document,
      'kanbanId': instance.kanbanId,
      'deleteT': instance.deleteT,
      'ddTask': instance.ddTask,
    };

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
    fullName: json['fullName'] as String?,
    email: json['email'] as String?,
    photo: json['photo'] as String?,
    telephone: json['telephone'] as String?,
    detail: json['detail'] as String?,
    job: json['job'] as String?,
    companyId: json['companyId'] as String?,
    birthday: json['birthday'] as String?,
  );
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'photo': instance.photo,
      'telephone': instance.telephone,
      'detail': instance.detail,
      'job': instance.job,
      'companyId': instance.companyId,
      'birthday': instance.birthday,
    };

Doc _$DocFromJson(Map<String, dynamic> json) {
  return Doc(
    id: json['id'] as String?,
    isActive: json['isActive'] as String?,
    projectAccess: json['projectAccess'] as String?,
    userId: json['userId'] as String?,
    date: json['date'] as String?,
    location: json['location'] as String?,
    name: json['name'] as String?,
    uzanti: json['uzanti'] as String?,
    boyut: json['boyut'] as String?,
  );
}

Map<String, dynamic> _$DocToJson(Doc instance) => <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'projectAccess': instance.projectAccess,
      'userId': instance.userId,
      'date': instance.date,
      'location': instance.location,
      'name': instance.name,
      'uzanti': instance.uzanti,
      'boyut': instance.boyut,
    };
