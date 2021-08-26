import 'package:dio/dio.dart';

import '../model/project_model.dart';

abstract class IProjectService {
  final Dio dio;

  IProjectService(this.dio);

  Future<ProjectModel> fetchAllTask(String token);
}
