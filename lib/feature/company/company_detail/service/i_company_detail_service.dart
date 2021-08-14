import 'package:crm_app/feature/company/company_detail/model/company_detail_model.dart';
import 'package:dio/dio.dart';

abstract class ICompanyDetailService {
  final Dio dio;

  ICompanyDetailService(this.dio);

  Future<CompanyDetailModel> fetchAllTask(String token,String id);
}
