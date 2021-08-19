import 'package:dio/dio.dart';

import '../model/profile_model.dart';


abstract class IProfileService {
  final Dio dio;

  IProfileService(this.dio);

  Future<ProfileModel> fetchAllTask(String token,String username);
}