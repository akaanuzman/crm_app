import 'dart:convert';
import 'dart:io';

import 'package:crm_app/feature/project/model/project_model.dart';
import 'package:crm_app/feature/project/service/project_service_end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'i_project_service.dart';

class ProjectService extends IProjectService {
  ProjectService(Dio dio) : super(dio);

  @override
  Future<List<ProjectModel>> fetchAllTask(String token) async {
    debugPrint("Token2: $token");
    final response =
        await dio.get(ProjectServiceEndPoints.PROJECT.rawValue(token));
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      debugPrint(data.toString());

      return [];
    }
    return [];
  }
}
