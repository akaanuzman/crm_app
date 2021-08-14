import 'dart:convert';
import 'dart:io';

import '../model/company_model.dart';
import 'package:dio/dio.dart';

import 'company_service_end_points.dart';
import 'i_company_service.dart';

class CompanyService extends ICompanyService {
  CompanyService(Dio dio) : super(dio);

  @override
  Future<CompanyModel> fetchAllTask(String token) async {
    final response =
        await dio.get(CompanyServiceEndPoints.company.rawValue(token));
    if (response.statusCode == HttpStatus.ok) {
      return CompanyModel.fromJson(jsonDecode(response.data));
    }
    return CompanyModel();
  }
}
