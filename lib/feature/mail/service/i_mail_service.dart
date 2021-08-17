import '../model/mail_model.dart';
import 'package:dio/dio.dart';

abstract class IMailService {
  final Dio dio;

  IMailService(this.dio);

  Future<MailModel> fetchAllTask(String token,String category);
}