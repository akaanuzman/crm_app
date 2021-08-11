import 'package:crm_app/feature/project/projectdetail/model/project_detail_model.dart';
import 'package:dio/dio.dart';

abstract class IProjectDetailService {
  final Dio dio;

  IProjectDetailService(this.dio);

  Future<ProjectDetailModel> fetchAllTask(String token,String projectId);
}