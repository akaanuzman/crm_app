import '../../../core/init/network/network_manager.dart';
import '../service/project_service.dart';

import '../../../core/constants/app/app_constants.dart';

import '../model/project_model.dart';
import '../service/i_project_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'project_view_model.g.dart';

class ProjectViewModel = _ProjectViewModelBase with _$ProjectViewModel;

abstract class _ProjectViewModelBase with Store {
  BuildContext? context;
  late IProjectService projectService;

  @observable
  List<ProjectModel> items = [];

  _ProjectViewModelBase() {
    projectService = ProjectService(NetworkManager.instance!.dio);
    fetchItems(ApplicationConstants.instance!.token);
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token) async {
    items = await projectService.fetchAllTask(token);
  }
}
