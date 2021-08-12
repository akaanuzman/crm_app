import '../model/company_model.dart';
import 'package:dio/dio.dart';

abstract class ICompanyService {
  final Dio dio;

  ICompanyService(this.dio);

  Future<CompanyModel> fetchAllTask(String token);
}
