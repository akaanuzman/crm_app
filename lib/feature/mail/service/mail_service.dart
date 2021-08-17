import 'dart:convert';
import 'dart:io';

import '../model/mail_model.dart';
import 'package:dio/dio.dart';

import 'i_mail_service.dart';
import 'mail_service_end_points.dart';

class MailService extends IMailService {
  MailService(Dio dio) : super(dio);

  @override
  Future<MailModel> fetchAllTask(String token, String category) async {
    if (category == "") {
      final response =
          await dio.get(MailServiceEndPoints.send.rawValue(token, category));
      if (response.statusCode == HttpStatus.ok) {
        return MailModel.fromJson(jsonDecode(response.data));
      }
    } else {
      final response =
          await dio.get(MailServiceEndPoints.email.rawValue(token, category));
      if (response.statusCode == HttpStatus.ok) {
        return MailModel.fromJson(jsonDecode(response.data));
      }
    }

    return MailModel();
  }
}
