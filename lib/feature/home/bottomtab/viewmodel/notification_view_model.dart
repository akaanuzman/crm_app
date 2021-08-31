import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/notification_model.dart';
import '../service/i_notification_service.dart';
import '../service/notification_service.dart';

part 'notification_view_model.g.dart';

class NotificationViewModel = _NotificationViewModelBase
    with _$NotificationViewModel;

abstract class _NotificationViewModelBase with Store {
  BuildContext? context;
  late INotificationService notificationService;

  @observable
  NotificationModel items = NotificationModel();

  _NotificationViewModelBase() {
    notificationService = NotificationService(NetworkManager.instance!.dio);
    fetchItems(ApplicationConstants.instance!.token);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token) async {
    items = await notificationService.fetchAllTask(token);
  }
}
