import '../../model/experience/experience_model.dart';
import 'package:dio/dio.dart';



abstract class IExperienceService {
  final Dio dio;

  IExperienceService(this.dio);

  Future<ExperienceModel> fetchAllTask(String token);
}