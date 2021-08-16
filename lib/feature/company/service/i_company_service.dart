import 'package:dio/dio.dart';

import '../model/company_model.dart';

abstract class ICompanyService {
  final Dio dio;

  ICompanyService(this.dio);

  Future<CompanyModel> fetchAllTask(String token);
}
