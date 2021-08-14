// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return CompanyModel(
    message: json['message'] as String?,
    userid: json['userid'] as String?,
    companys: (json['companys'] as List<dynamic>?)
        ?.map((e) => Companys.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'companys': instance.companys,
    };

Companys _$CompanysFromJson(Map<String, dynamic> json) {
  return Companys(
    name: json['name'] as String?,
    email: json['email'] as String?,
    telephone: json['telephone'] as String?,
    location: json['location'] as String?,
    webSite: json['webSite'] as String?,
    photo: json['photo'] as String?,
  )..id = json['id'] as String?;
}

Map<String, dynamic> _$CompanysToJson(Companys instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'telephone': instance.telephone,
      'location': instance.location,
      'webSite': instance.webSite,
      'photo': instance.photo,
    };
