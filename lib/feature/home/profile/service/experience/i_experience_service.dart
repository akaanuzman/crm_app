import 'package:dio/dio.dart';

import '../../model/experience/experience_model.dart';



abstract class IExperienceService {
  final Dio dio;

  IExperienceService(this.dio);

  Future<ExperienceModel> fetchAllTask(String token);
}