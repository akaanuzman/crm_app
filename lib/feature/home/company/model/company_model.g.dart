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
    id: json['id'] as String?,
    name: json['name'] as String?,
    c_name: json['c_name'] as String?,
    is_active: json['is_active'] as String?,
    email: json['email'] as String?,
    telephone: json['telephone'] as String?,
    web_site: json['web_site'] as String?,
    address: json['address'] as String?,
    detail: json['detail'] as String?,
    photo: json['photo'] as String?,
    tax_number: json['tax_number'] as String?,
    tax_department: json['tax_department'] as String?,
    location: json['location'] as String?,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'c_name': instance.c_name,
      'is_active': instance.is_active,
      'email': instance.email,
      'telephone': instance.telephone,
      'web_site': instance.web_site,
      'address': instance.address,
      'detail': instance.detail,
      'photo': instance.photo,
      'tax_number': instance.tax_number,
      'tax_department': instance.tax_department,
      'location': instance.location,
    };
