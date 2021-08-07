import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'i_login_service.dart';
import 'login_service_end_points.dart';

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<String> fetchAllTask(String email, String password) async {
    final response = await dio
        .get(LoginServiceEndPoints.ENDPOINTS.rawValue(email, password));

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      var a = jsonDecode(data);
      postToken(a);
      return a['status'];

      //return a.map((e) => LoginModel.fromJson(e)).toList();
    }
    return "";
  }

  Future<void> postToken(var data) async {
    var response = await dio.post("Projects/get_projects?token=${data['token']}");
    debugPrint(response.toString());
  }
}
