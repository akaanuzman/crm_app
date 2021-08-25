// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDetailModel _$CompanyDetailModelFromJson(Map<String, dynamic> json) {
  return CompanyDetailModel(
    message: json['message'] as String?,
    userid: json['userid'] as String?,
    id: json['id'] as String?,
    worker: (json['worker'] as List<dynamic>?)
        ?.map((e) => Worker.fromJson(e as Map<String, dynamic>))
        .toList(),
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

Map<String, dynamic> _$CompanyDetailModelToJson(CompanyDetailModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userid': instance.userid,
      'id': instance.id,
      'worker': instance.worker,
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

Worker _$WorkerFromJson(Map<String, dynamic> json) {
  return Worker(
    full_name: json['full_name'] as String?,
    email: json['email'] as String?,
    photo: json['photo'] as String?,
    telephone: json['telephone'] as String?,
    detail: json['detail'] as String?,
    job: json['job'] as String?,
    company_id: json['company_id'] as String?,
    birthday: json['birthday'] as String?,
  );
}

Map<String, dynamic> _$WorkerToJson(Worker instance) => <String, dynamic>{
      'full_name': instance.full_name,
      'email': instance.email,
      'photo': instance.photo,
      'telephone': instance.telephone,
      'detail': instance.detail,
      'job': instance.job,
      'company_id': instance.company_id,
      'birthday': instance.birthday,
    };
