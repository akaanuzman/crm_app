import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:crm_app/core/init/network/network_manager.dart';
import 'package:crm_app/feature/project/projectdetail/model/project_detail_model.dart';
import 'package:crm_app/feature/project/projectdetail/service/i_project_detail_service.dart';
import 'package:crm_app/feature/project/projectdetail/service/project_detail_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'project_detail_view_model.g.dart';

class ProjectDetailViewModel = _ProjectDetailViewModelBase
    with _$ProjectDetailViewModel;

abstract class _ProjectDetailViewModelBase with Store {
  BuildContext? context;
  late IProjectDetailService projectDetailService;

  List<String> menuItems = ["Liste", "Kanban"];

  @observable
  late String menuValue = menuItems.first;

  @observable
  ProjectDetailModel items = ProjectDetailModel();

  _ProjectDetailViewModelBase() {
    projectDetailService = ProjectDetailService(NetworkManager.instance!.dio);
  }

  @action
  void onChanged(Object value) {
    menuValue = value.toString();
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> fetchItems(String token,String projectId) async {
    items = await projectDetailService.fetchAllTask(token,projectId);
  }
}
