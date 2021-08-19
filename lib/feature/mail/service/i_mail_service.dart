import 'package:dio/dio.dart';

import '../model/mail_model.dart';

abstract class IMailService {
  final Dio dio;

  IMailService(this.dio);

  Future<MailModel> fetchAllTask(String token,String category);
}