import 'dart:io';

import '../../model/profile/profile_model.dart';

import 'profile_service_end_points.dart';
import 'package:dio/dio.dart';

import 'i_profile_service.dart';

class ProfileService extends IProfileService {
  ProfileService(Dio dio) : super(dio);

  @override
  Future<ProfileModel> fetchAllTask(String token, String username) async {
    if (username == "") {
      final response = await dio
          .get(ProfileServiceEndPoints.myProfile.rawValue(token, username));
      if (response.statusCode == HttpStatus.ok) {
        return ProfileModel.fromJson(response.data);
      }
    } else {
      final response = await dio
          .get(ProfileServiceEndPoints.profile.rawValue(token, username));
      if (response.statusCode == HttpStatus.ok) {
        return ProfileModel.fromJson(response.data);
      }
    }
    return ProfileModel();
  }
}
