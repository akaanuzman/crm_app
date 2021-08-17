import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/init/network/network_manager.dart';
import '../model/contact_model.dart';
import '../service/contact_service.dart';
import '../service/i_contact_service.dart';

part 'contact_view_model.g.dart';

class ContactViewModel = _ContactViewModelBase with _$ContactViewModel;

abstract class _ContactViewModelBase with Store {
  BuildContext? context;
  late IContactService contactService;

  @observable
  ContactModel items = ContactModel();

  _ContactViewModelBase() {
    contactService = ContactService(NetworkManager.instance!.dio);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token) async {
    items = await contactService.fetchAllTask(token);
  }
}
