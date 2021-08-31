import 'package:dio/dio.dart';

import '../model/notification_model.dart';


abstract class INotificationService {
  final Dio dio;

  INotificationService(this.dio);

  Future<NotificationModel> fetchAllTask(String token);
}
