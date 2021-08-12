import 'package:dio/dio.dart';

import '../model/project_detail_model.dart';

abstract class IProjectDetailService {
  final Dio dio;

  IProjectDetailService(this.dio);

  Future<ProjectDetailModel> fetchAllTask(String token,String projectId);
}