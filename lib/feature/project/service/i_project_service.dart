import 'package:dio/dio.dart';

import '../model/project_model.dart';

abstract class IProjectService {
  final Dio dio;

  IProjectService(this.dio);

  Future<List<ProjectModel>> fetchAllTask(String token);
}
