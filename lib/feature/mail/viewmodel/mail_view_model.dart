import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/init/network/network_manager.dart';
import '../model/mail_model.dart';
import '../service/i_mail_service.dart';
import '../service/mail_service.dart';

part 'mail_view_model.g.dart';

class MailViewModel = _MailViewModelBase with _$MailViewModel;

abstract class _MailViewModelBase with Store {
  BuildContext? context;
  late IMailService mailService;

  @observable
  bool isContainerHeightChange = true;

  @observable
  MailModel items = MailModel();

  _MailViewModelBase() {
    mailService = MailService(NetworkManager.instance!.dio);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token, String category) async {
    items = await mailService.fetchAllTask(token, category);
  }

  @action
  void changeContainerHeight() {
    isContainerHeightChange = !isContainerHeightChange;
  }
}
