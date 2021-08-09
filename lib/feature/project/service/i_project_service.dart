import 'package:crm_app/feature/project/model/project_model.dart';
import 'package:dio/dio.dart';

abstract class IProjectService {
  final Dio dio;

  IProjectService(this.dio);

  Future<List<ProjectModel>> fetchAllTask(String token);
}
