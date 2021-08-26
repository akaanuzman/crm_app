
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/init/network/network_manager.dart';

import '../../model/experience/experience_model.dart';
import '../../service/experience/experience_service.dart';
import '../../service/experience/i_experience_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'experience_view_model.g.dart';

class ExperienceViewModel = _ExperienceViewModelBase with _$ExperienceViewModel;

abstract class _ExperienceViewModelBase with Store {
    BuildContext? context;
  late IExperienceService experienceService;

  @observable
  ExperienceModel items = ExperienceModel();

  _ExperienceViewModelBase() {
    experienceService = ExperienceService(NetworkManager.instance!.dio);
    fetchItems(ApplicationConstants.instance!.token);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token) async {
    items = await experienceService.fetchAllTask(token);
  }
}