import '../model/profile_model.dart';
import 'package:dio/dio.dart';


abstract class IProfileService {
  final Dio dio;

  IProfileService(this.dio);

  Future<ProfileModel> fetchAllTask(String token,String username);
}