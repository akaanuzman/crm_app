import '../model/project_detail_model.dart';
import 'package:mobx/mobx.dart';
import 'package:mysql1/mysql1.dart';
part 'project_detail_view_model.g.dart';

class ProjectDetailViewModel = _ProjectDetailViewModelBase
    with _$ProjectDetailViewModel;

abstract class _ProjectDetailViewModelBase with Store {
  @observable
  List<ProjectDetailModel> items = [];

  @action
  Future<void> connectDataBase() async {
    var settings = ConnectionSettings(
        host: '192.168.2.136',
        port: 3306,
        user: 'root',
        //password: '',
        db: 'sistem');

    var conn = await MySqlConnection.connect(settings);

    fetchList(conn, settings, "Proje 1 Görev 1");
  }

  Future<void> fetchList(
      MySqlConnection conn, ConnectionSettings settings, String name) async {
    var result =
        await conn.query('select * from tasks from where name = "$name"');

    for (var row in result) {
      ProjectDetailModel model = ProjectDetailModel.fromJson(row.fields);
      items.add(model);
      //debugPrint(items[0].sDate);
    }
  }
}
