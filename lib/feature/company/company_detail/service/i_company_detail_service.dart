import 'package:dio/dio.dart';

import '../model/company_detail_model.dart';

abstract class ICompanyDetailService {
  final Dio dio;

  ICompanyDetailService(this.dio);

  Future<CompanyDetailModel> fetchAllTask(String token,String id);
}
