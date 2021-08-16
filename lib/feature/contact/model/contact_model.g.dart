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
    guides: (json['guides'] as List<dynamic>?)
        ?.map((e) => Guides.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'users': instance.users,
      'guides': instance.guides,
    };

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
    screenName: json['screenName'] as String?,
    full_name: json['full_name'] as String?,
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
      'full_name': instance.full_name,
      'company': instance.company,
      'email': instance.email,
      'photo': instance.photo,
      'telephone': instance.telephone,
      'detail': instance.detail,
      'job': instance.job,
      'birthday': instance.birthday,
    };

Guides _$GuidesFromJson(Map<String, dynamic> json) {
  return Guides(
    id: json['id'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    isActive: json['isActive'] as String?,
    detail: json['detail'] as String?,
    company: json['company'] as String?,
    companyId: json['companyId'] as String?,
    job: json['job'] as String?,
    birthday: json['birthday'] as String?,
    added: json['added'] as String?,
    updated: json['updated'] as String?,
    webSite: json['webSite'] as String?,
    location: json['location'] as String?,
    photo: json['photo'] as String?,
    userId: json['userId'] as String?,
    customer: json['customer'] as String?,
    worker: json['worker'] as String?,
  );
}

Map<String, dynamic> _$GuidesToJson(Guides instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'isActive': instance.isActive,
      'detail': instance.detail,
      'company': instance.company,
      'companyId': instance.companyId,
      'job': instance.job,
      'birthday': instance.birthday,
      'added': instance.added,
      'updated': instance.updated,
      'webSite': instance.webSite,
      'location': instance.location,
      'photo': instance.photo,
      'userId': instance.userId,
      'customer': instance.customer,
      'worker': instance.worker,
    };
