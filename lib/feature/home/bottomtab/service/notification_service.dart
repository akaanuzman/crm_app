import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../model/notification_model.dart';
import 'i_notification_service.dart';
import 'notification_service_end_points.dart';

class NotificationService extends INotificationService {
  NotificationService(Dio dio) : super(dio);

  @override
  Future<NotificationModel> fetchAllTask(String token) async {
    final response = await dio
        .get(NotificationServiceEndPoints.notifications.rawValue(token));
    if (response.statusCode == HttpStatus.ok) {
      return NotificationModel.fromJson(jsonDecode(response.data));
    }
    return NotificationModel();
  }
}
