import 'dart:convert';
import 'dart:io';

import '../../../../core/constants/app/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'i_login_service.dart';
import 'login_service_end_points.dart';

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<List<String>> fetchAllTask(String email, String password) async {
    final response = await dio
        .get(LoginServiceEndPoints.endpoints.rawValue(email, password));

    if (response.statusCode == HttpStatus.ok) {
      List<String> items = [];
      final data = response.data;
      var a = jsonDecode(data);
      debugPrint("Token1: "+a['token']);
      await dio.post("Projects/get_projects?token=${a['token']}");
      //debugPrint(b.toString());
      ApplicationConstants.instance!.token = a['token'];
      items.add(a['token']);
      items.add(a['status']);
      return items;

      //return a.map((e) => LoginModel.fromJson(e)).toList();
    }
    return [];
  }
}
