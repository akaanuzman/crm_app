import 'dart:io';

import '../../model/experience/experience_model.dart';

import 'package:dio/dio.dart';

import 'experience_service_endpoints.dart';
import 'i_experience_service.dart';

class ExperienceService extends IExperienceService {
  ExperienceService(Dio dio) : super(dio);

  @override
  Future<ExperienceModel> fetchAllTask(String token) async {
    final response =
        await dio.get(ExperienceServiceEndPoints.experience.rawValue(token));
    if (response.statusCode == HttpStatus.ok) {
      return ExperienceModel.fromJson(response.data);
    }

    return ExperienceModel();
  }
}
