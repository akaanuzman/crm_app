import 'package:mobx/mobx.dart';
part 'project_detail_view_model.g.dart';

class ProjectDetailViewModel = _ProjectDetailViewModelBase
    with _$ProjectDetailViewModel;

abstract class _ProjectDetailViewModelBase with Store {
  @observable
  late String menuValue = menuItems.first;
  List<String> menuItems = ["Liste", "Kanban"];

  @action
  void onChanged(Object value) {
    menuValue = value.toString();
  }
}
