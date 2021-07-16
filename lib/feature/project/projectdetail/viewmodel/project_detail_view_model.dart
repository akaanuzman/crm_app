
import '../model/project_detail_model.dart';
import 'package:mobx/mobx.dart';
import 'package:mysql1/mysql1.dart';
part 'project_detail_view_model.g.dart';

class ProjectDetailViewModel = _ProjectDetailViewModelBase
    with _$ProjectDetailViewModel;

abstract class _ProjectDetailViewModelBase with Store {
  @observable
  List<ProjectDetailModel> items = [];

  @observable
  late String menuValue = menuItems.first;

  List<String> menuItems = ["Liste", "Kanban"];

  @action
  Future<void> connectDataBase(int projectId) async {
    var settings = ConnectionSettings(
        host: '192.168.2.136', port: 3306, user: 'root', db: 'sistem');

    var conn = await MySqlConnection.connect(settings);

    fetchList(conn, settings, projectId);
  }

  Future<void> fetchList(
      MySqlConnection conn, ConnectionSettings settings, int projectId) async {
    var result =
        await conn.query('select * from tasks where project_id = $projectId');

    for (var row in result) {
      ProjectDetailModel model = ProjectDetailModel.fromJson(row.fields);
      items.add(model);
    }
  }

  @action
  void onChanged(Object value) {
    menuValue = value.toString();
  }
}
