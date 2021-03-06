import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../model/company_detail_model.dart';
import 'company_detail_service_end_points.dart';
import 'i_company_detail_service.dart';

class CompanyDetailService extends ICompanyDetailService {
  CompanyDetailService(Dio dio) : super(dio);

  @override
  Future<CompanyDetailModel> fetchAllTask(String token, String id) async {
    final response = await dio
        .get(CompanyDetailServiceEndPoints.companyDetail.rawValue(token, id));
    if (response.statusCode == HttpStatus.ok) {
      return CompanyDetailModel.fromJson(jsonDecode(response.data));
    }
    return CompanyDetailModel();
  }
}
