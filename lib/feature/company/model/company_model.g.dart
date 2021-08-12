// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return CompanyModel(
    message: json['message'] as String?,
    userid: json['userid'] as String?,
    company: (json['company'] as List<dynamic>?)
        ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'company': instance.company,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    name: json['name'] as String?,
    email: json['email'] as String?,
    telephone: json['telephone'] as String?,
    location: json['location'] as String?,
    webSite: json['webSite'] as String?,
    photo: json['photo'] as String?,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'telephone': instance.telephone,
      'location': instance.location,
      'webSite': instance.webSite,
      'photo': instance.photo,
    };
