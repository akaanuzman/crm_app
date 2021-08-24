import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/init/network/network_manager.dart';
import '../model/profile_model.dart';
import '../service/i_profile_service.dart';
import '../service/profile_service.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  BuildContext? context;
  late IProfileService profileService;

  @observable
  ProfileModel items = ProfileModel();

  _ProfileViewModelBase() {
    profileService = ProfileService(NetworkManager.instance!.dio);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token, String username) async {
    items = await profileService.fetchAllTask(token, username);
  }
}
