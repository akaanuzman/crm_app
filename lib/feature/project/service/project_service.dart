import 'dart:io';

import '../model/project_model.dart';
import 'project_service_end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'i_project_service.dart';

class ProjectService extends IProjectService {
  ProjectService(Dio dio) : super(dio);

  @override
  Future<List<ProjectModel>> fetchAllTask(String token) async {
    debugPrint("Token2: $token");
    final response =
        await dio.get(ProjectServiceEndPoints.project.rawValue(token));
    if (response.statusCode == HttpStatus.ok) {
      final jsonItem = response.data;
      if(jsonItem is List){
        return jsonItem.map((e) => ProjectModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
