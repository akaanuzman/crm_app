import 'dart:io';

import '../model/project_detail_model.dart';
import 'package:dio/dio.dart';
import 'i_project_detail_service.dart';
import 'project_detail_service_end_points.dart';

class ProjectDetailService extends IProjectDetailService {
  ProjectDetailService(Dio dio) : super(dio);

  @override
  Future<ProjectDetailModel> fetchAllTask(
      String token, String projectId) async {
    final response = await dio
        .get(ProjectDetailServiceEndPoints.project.rawValue(token, projectId));
    if (response.statusCode == HttpStatus.ok) {
      return ProjectDetailModel.fromJson(response.data);
    }
    return ProjectDetailModel();
  }
}
