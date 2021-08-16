import '../../../core/constants/app/app_constants.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/profile_model.dart';
import '../service/i_profile_service.dart';
import '../service/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  BuildContext? context;
  late IProfileService profileService;

  @observable
  ProfileModel items = ProfileModel();

  _ProfileViewModelBase() {
    profileService = ProfileService(NetworkManager.instance!.dio);
    fetchItems(ApplicationConstants.instance!.token);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token) async {
    items = await profileService.fetchAllTask(token);
  }
}
