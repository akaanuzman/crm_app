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
    cName: json['cName'] as String?,
    isActive: json['isActive'] as String?,
    email: json['email'] as String?,
    telephone: json['telephone'] as String?,
    webSite: json['web_site'] as String?,
    address: json['address'] as String?,
    detail: json['detail'] as String?,
    photo: json['photo'] as String?,
    taxNumber: json['tax_number'] as String?,
    taxDepartment: json['tax_department'] as String?,
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
      'cName': instance.cName,
      'isActive': instance.isActive,
      'email': instance.email,
      'telephone': instance.telephone,
      'webSite': instance.webSite,
      'address': instance.address,
      'detail': instance.detail,
      'photo': instance.photo,
      'taxNumber': instance.taxNumber,
      'taxDepartment': instance.taxDepartment,
      'location': instance.location,
    };

Worker _$WorkerFromJson(Map<String, dynamic> json) {
  return Worker(
    fullName: json['full_name'] as String?,
    email: json['email'] as String?,
    photo: json['photo'] as String?,
    telephone: json['telephone'] as String?,
    detail: json['detail'] as String?,
    job: json['job'] as String?,
    companyId: json['companyId'] as String?,
    birthday: json['birthday'] as String?,
  );
}

Map<String, dynamic> _$WorkerToJson(Worker instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'photo': instance.photo,
      'telephone': instance.telephone,
      'detail': instance.detail,
      'job': instance.job,
      'companyId': instance.companyId,
      'birthday': instance.birthday,
    };
