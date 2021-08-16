import 'dart:io';

import '../model/profile_model.dart';
import 'profile_service_end_points.dart';
import 'package:dio/dio.dart';

import 'i_profile_service.dart';

class ProfileService extends IProfileService {
  ProfileService(Dio dio) : super(dio);

  @override
  Future<ProfileModel> fetchAllTask(String token) async {
    final response =
        await dio.get(ProfileServiceEndPoints.profile.rawValue(token));
    if (response.statusCode == HttpStatus.ok) {
      return ProfileModel.fromJson(response.data);
    }
    return ProfileModel();
  }
}
