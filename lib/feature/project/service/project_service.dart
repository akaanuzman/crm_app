import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/project_model.dart';
import 'i_project_service.dart';
import 'project_service_end_points.dart';

class ProjectService extends IProjectService {
  ProjectService(Dio dio) : super(dio);

  @override
  Future<ProjectModel> fetchAllTask(String token) async {
    debugPrint("Token2: $token");
    final response =
        await dio.get(ProjectServiceEndPoints.project.rawValue(token));
    if (response.statusCode == HttpStatus.ok) {
      return ProjectModel.fromJson(response.data);
    }
    return ProjectModel();
  }
}
